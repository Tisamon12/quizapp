<template lang="pug">
	#new_question
		v-app
			v-main
				v-container(fluid)
					v-row(justify="center" align="center")
						v-col(cols="4")
							v-card(class="mx-auto" outlined)
								v-card-title
									| Dodaj pytanie

								ValidationObserver(v-slot="{ invalid }")
									v-card-text
										v-form
											ValidationProvider(v-slot="{ errors }" rules="required" name="Question")
												v-text-field(label="Pytanie" name="question" type="text" v-model="question" :error-messages="errors")

											v-radio-group(v-model="correctAnswerIndex")
												ValidationProvider(v-slot="{ errors }" rules="required" v-for="(answer, index) in answers")
													v-row
														v-col(cols="10")
															v-text-field(:label="`Odpowiedź ${index + 1}`" type="text" v-model="answers[index]" :error-messages="errors")

														v-col(cols="2")
															v-radio(:key="index" :value="index" class="mt-4")

									v-card-actions
										v-btn(color="primary" @click="addQuestion()" :disabled="invalid")
											| Dodaj pytanie

				v-snackbar(v-model="questionError")
					| Ups! Coś poszło nie tak


</template>

<script src="./cmp.js"/>