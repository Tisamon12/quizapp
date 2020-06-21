import Vue from 'vue'
import Router from 'vue-router'
import signForm from './components/signForm/cmp'
import categories from './components/categories/cmp'
import game from './components/game/cmp'

Vue.use(Router)

export const router = new Router({
	routes: [
		{
			path: '/',
			name: "SignForm",
			component: signForm
		},
		{
			path: '/categories',
			name: "Categories",
			component: categories
		},
		{
			path: '/game/:id',
			name: "Game",
			component: game
		}
	]
})