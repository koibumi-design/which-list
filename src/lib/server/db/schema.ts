import { pgTable, serial, text, integer, uuid, varchar, index, boolean, pgEnum } from 'drizzle-orm/pg-core';

export const user = pgTable('user', {
	id: uuid('id').primaryKey().defaultRandom(),
	email: varchar('email').unique().notNull(),
	password: text('password').notNull(),
}, table => ({
	emailIdx: index('email_idx').on(table.email),
}));

export const project = pgTable('project', {
	id: uuid('id').primaryKey().defaultRandom(),
	name: text('name').notNull(),
	isArchived: boolean('is_archived').notNull().default(false),
});

export const projectMemberRule = pgEnum('project_member_rule', ['owner', 'manager', 'member']);
export const projectMember = pgTable('project_member', {
	id: serial('id').primaryKey(),
	projectId: uuid('project_id').notNull().references(() => project.id),
	userId: uuid('user_id').notNull().references(() => user.id),
	rule: projectMemberRule('rule').notNull().default('member'),
}, table => ({
	projectIdIdx: index('project_id_idx').on(table.projectId),
	userIdIdx: index('user_id_idx').on(table.userId),
}))


export const issue = pgTable('issue', {
	id: uuid('id').primaryKey().defaultRandom(),
	projectId: uuid('project_id').notNull().references(() => project.id),
	assignedTo: uuid('assigned_to').array().notNull().default([]),
	title: text('title').notNull(),
	description: text('description').notNull(),
	priority: integer('priority').notNull().default(3),
	isInProgress: boolean('is_in_progress').notNull().default(false),
	isAccomplished: boolean('is_accomplished').notNull().default(false),
	canBeStarted: boolean('can_be_started').notNull().default(false),
	dependsOn: uuid('depends_on').array().notNull().default([]),
	anyOfDependsOn: boolean('any_of_depends_on').notNull().default(false),
}, table => ({
	projectIdIdx: index('project_id_idx').on(table.projectId),
	assignedToIdx: index('assigned_to_idx').on(table.assignedTo),
	dependsOnIdx: index('depends_on_idx').on(table.dependsOn),
}))