import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import TodoList from '../views/TodoList.vue'
import TodoNew from '../views/TodoNew.vue'
import TodoEdit from '../views/TodoEdit.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/todo',
    name: 'TodoList',
    component: TodoList
  },
  {
    path: '/todo/new',
    name: 'TodoNew',
    component: TodoNew
  },
  {
    path: '/todo/:id',
    name: 'TodoEdit',
    component: TodoEdit
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
