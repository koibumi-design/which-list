<script lang="ts">
	let { children } = $props();
</script>

<div class="flex flex-row">
	<header
		class="border-r border-neutral-500 py-8 px-6 min-h-screen flex flex-col gap-6 min-w-64"
	>
		<h1>
			<a href="/" class="flex items-center text-lg font-bold">
				<img
					src="/favicon.svg"
					alt="Logo"
					class="w-8 h-8 inline-block mr-2"
				/>
				Which List
			</a>
		</h1>
		<div>
			<p class="text-sm font-bold">
				Project
			</p>
		</div>
	</header>
	<div class="flex-1 px-4 py-10">
		<main class="mx-auto max-w-6xl ">
			{@render children()}
		</main>
	</div>


</div>


