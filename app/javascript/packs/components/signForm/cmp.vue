<template lang="pug">
	v-app(id="inspire")
		v-main
			v-container(class="fill-height" fluid)
				v-row(align="center" justify="center")
					v-col(cols="12" sm="8" md="4")
						v-card(class="elevation-12")
							#sign-in-form(v-if="signInForm")
								v-toolbar(color="primary" dark flat)
									v-toolbar-title
										| Zaloguj się

								ValidationObserver(v-slot="{ invalid }")
									v-card-text
										v-form
											ValidationProvider(v-slot="{ errors }" rules="required" name="Login")
												v-text-field(label="Login" name="login" prepend-icon="mdi-account" type="text" v-model="login")

											ValidationProvider(v-slot="{ errors }" rules="required" name="Password")
												v-text-field(label="Hasło" name="password" prepend-icon="mdi-lock" type="password" v-model="password")

									v-card-actions
										v-btn(color="primary" @click="signInForm = false" text=true)
											| Załóż konto
										v-spacer
										v-btn(color="primary" @click="signIn()" :disabled="invalid")
											| Zaloguj się
							
							#sign-up-form(v-else)
								v-toolbar(color="primary" dark flat)
									v-toolbar-title
										| Załóż konto

								ValidationObserver(v-slot="{ invalid }")
									v-card-text

										v-form
											ValidationProvider(v-slot="{ errors }" rules="required" name="Login")
												v-text-field(label="Login" prepend-icon="mdi-account" type="text" v-model="login" :error-messages="errors")

											ValidationProvider(v-slot="{ errors }" rules="required" name="Password" vid="password")
												v-text-field(label="Hasło" prepend-icon="mdi-lock" type="password" v-model="password" :error-messages="errors")

											ValidationProvider(v-slot="{ errors }" rules="required|confirmed:password" name="passwordConfirmation")
												v-text-field(label="Potwierdź hasło" prepend-icon="mdi-lock" type="password" v-model="passwordConfirmation" :error-messages="errors")

									v-card-actions
										v-btn(color="primary" @click="signInForm = true" text=true)
											| Zaloguj się
										v-spacer
										v-btn(color="primary" @click="signUp()" :disabled="invalid")
											| Zarejestruj się

		v-snackbar(v-model="loginError")
			| Podano niepoprawny login lub hasło


					

</template>
<script src='./cmp.js'/>