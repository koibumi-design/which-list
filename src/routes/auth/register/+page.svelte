<title>
	Register to Which List
</title>

<h1 class="text-center font-bold text-xl">
	Register to Which List
</h1>
<form method="POST">
	<label
		for="email"
		class="block text-sm font-medium my-1"
	>
		Email
	</label>
	<input
		type="email"
		id="email"
		placeholder="Email"
		name="email"
		class="input mb-2"
	/>

	<label
		for="password"
		class="block text-sm font-medium my-1"
	>
		Password
	</label>
	<input
		type="password"
		id="password"
		placeholder="Password"
		name="password"
		class="input mb-2"
	/>

	<label
		for="repeat-password"
		class="block text-sm font-medium my-1"
	>
		Repeat Password
	</label>
	<input
		type="password"
		id="repeat-password"
		placeholder="Repeat Password"
		name="repeat-password"
		class="input mb-2"
	/>

	<button
		type="submit"
		class="rounded-lg mt-4 p-2 bg-teal-600 w-full hover:bg-teal-700 duration-200"
	>
		Register
	</button>
</form>
<div class="my-4">
	<a href="/auth/login" class="anchor">Login</a>
</div>