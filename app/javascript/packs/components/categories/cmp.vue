<template lang="pug">
	#categories
		v-app
			v-main
				v-container(fluid)
					v-row
						v-col(md="3")
						v-col(md="6")
							v-row
								v-col(md="4" v-for="category in categories" :key="category.id")
									v-card(class="mx-auto" outlined)
										v-card-title
											| {{category.title}}
										v-card-actions
											v-btn(text @click="play(category.id)")
												| Zagraj		
						v-col(md="3")

						
</template>
<script src='./cmp.js'/>