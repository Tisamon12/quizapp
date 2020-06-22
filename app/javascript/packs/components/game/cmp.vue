<template lang="pug">
	#game
		v-app
			v-main
				v-container(fluid class="fill-height")
					v-row(justify="center" align="center")
						v-card(v-if="showScore")
							v-card-title
								| Odpowiedziałeś dobrze na {{correctAnswers}} pytań
							v-card-actions
								v-btn(@click="getQuestions" color="primary")
									| Zagraj jeszcze raz
								v-spacer
								v-btn(to="/categories")
									| Wróć

						v-btn(v-if="!gameStarted && !showScore" @click="getQuestions" color="primary")
							| Graj

						v-col(cols="4" v-if="gameStarted && currentQuestion")
							v-card(class="mx-auto" outlined)
								v-card-title
									v-progress-linear(v-model="timeLeft")
									| {{currentQuestion.content}}
								v-card-actions
									v-row
										v-col(cols="6" v-for="answer in currentQuestion.answers")
											v-btn(block @click="sendAnswer(answer)")
												| {{ answer }}



</template>
<script src='./cmp.js'/>