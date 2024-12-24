// See https://svelte.dev/docs/kit/types#app.d.ts
// for information about these interfaces
declare global {
	namespace App {

		// interface Error {}
		// interface Locals {}
		// interface PageData {}
		// interface PageState {}
		// interface Platform {}
	}
}

declare module '$env/static/private' {
	export const DATABASE_URL: string;
	export const ENABLE_REGISTER: boolean;
	export const SMTP_HOST: string;
	export const SMTP_PORT: number;
	export const SMTP_USER: string;
	export const SMTP_PASS: string;
}

export {};
