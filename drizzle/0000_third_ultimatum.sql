DO $$ BEGIN
 CREATE TYPE "public"."project_member_rule" AS ENUM('owner', 'manager', 'member');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "issue" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"project_id" uuid NOT NULL,
	"assigned_to" uuid[] DEFAULT  NOT NULL,
	"title" text NOT NULL,
	"description" text NOT NULL,
	"priority" integer DEFAULT 3 NOT NULL,
	"is_in_progress" boolean DEFAULT false NOT NULL,
	"is_accomplished" boolean DEFAULT false NOT NULL,
	"can_be_started" boolean DEFAULT false NOT NULL,
	"depends_on" uuid[] DEFAULT  NOT NULL,
	"any_of_depends_on" boolean DEFAULT false NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "project" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"name" text NOT NULL,
	"is_archived" boolean DEFAULT false NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "project_member" (
	"id" serial PRIMARY KEY NOT NULL,
	"project_id" uuid NOT NULL,
	"user_id" uuid NOT NULL,
	"rule" "project_member_rule" DEFAULT 'member' NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "user" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"email" varchar NOT NULL,
	"password" text NOT NULL,
	CONSTRAINT "user_email_unique" UNIQUE("email")
);
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "issue" ADD CONSTRAINT "issue_project_id_project_id_fk" FOREIGN KEY ("project_id") REFERENCES "public"."project"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "project_member" ADD CONSTRAINT "project_member_project_id_project_id_fk" FOREIGN KEY ("project_id") REFERENCES "public"."project"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "project_member" ADD CONSTRAINT "project_member_user_id_user_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "issue_project_id_idx" ON "issue" USING btree ("project_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "issue_assigned_to_idx" ON "issue" USING btree ("assigned_to");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "issue_depends_on_idx" ON "issue" USING btree ("depends_on");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "project_project_id_idx" ON "project_member" USING btree ("project_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "project_user_id_idx" ON "project_member" USING btree ("user_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "user_email_idx" ON "user" USING btree ("email");