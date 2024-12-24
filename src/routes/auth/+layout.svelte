<script lang="ts">
	let { children } = $props();
</script>


<main class="container max-w-xl mx-auto p-4 mt-32">
	<div class="surface-neutral-200-800 p-6 rounded-xl space-y-4">
		<img src="/favicon.svg" alt="Logo" class="w-36 h-36 mx-auto" />
		{@render children()}
	</div>
</main>
