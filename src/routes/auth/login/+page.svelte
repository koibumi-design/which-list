<script lang="ts">
</script>

<style lang="postcss">
    .input {
        @apply mt-1 surface-neutral-300-700 block w-full rounded-md shadow-sm;
        @apply focus:border-teal-500 focus:ring focus:ring-teal-500 focus:ring-opacity-50;
    }
</style>

<main class="container max-w-xl mx-auto p-4 mt-32">
	<div class="surface-neutral-200-800 p-6 rounded-xl space-y-4">
		<img src="/favicon.svg" alt="Logo" class="w-36 h-36 mx-auto" />
		<h1 class="text-center font-bold text-xl">
			Login to Which List
		</h1>
		<form>
			<label
				for="email"
				class="block text-sm font-medium"
			>
				Email
			</label>
			<input
				type="email"
				id="email"
				placeholder="Email"
				name="email"
				class="input mb-4"
			/>
			<label
				for="password"
				class="block text-sm font-medium"
			>
				Password
			</label>
			<input
				type="password"
				id="password"
				placeholder="Password"
				name="password"
				class="input"
			/>
			<button
				type="submit"
				class="rounded-lg my-4 p-2 bg-teal-600 w-full hover:bg-teal-700 duration-200"
			>
				Login
			</button>
		</form>
	</div>
</main>