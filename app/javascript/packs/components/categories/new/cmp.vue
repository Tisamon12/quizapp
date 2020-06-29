<template lang="pug">
	#new_category
		v-app
			v-main
				v-container(fluid)
					v-row(justify="center" align="center")
						v-col(cols="4")
							v-card(class="mx-auto" outlined)
								v-card-title
									| Dodaj kategorię

								ValidationObserver(v-slot="{ invalid }")
									v-card-text
										v-form
											ValidationProvider(v-slot="{ errors }" rules="required" name="Category")
												v-text-field(label="Kategoria" name="title" type="text" v-model="title" :error-messages="errors")

									v-card-actions
										v-btn(color="primary" @click="addCategory()" :disabled="invalid")
											| Dodaj kategorię

										v-btn(to="/categories")
											| Anuluj

				v-snackbar(v-model="categoryError")
					| Ups! Coś poszło nie tak


</template>

<script src="./cmp.js"/>