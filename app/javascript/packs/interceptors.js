import axios from 'axios'
import { router } from './router'

export default function setup() {
  axios.interceptors.request.use(function(config) {
      const token = localStorage.jwt;
      config.baseURL = "/api/v1/"
      if(token) {
          config.headers.Authorization = `Bearer ${token}`;
      }
      return config;
  }, function(err) {
      return Promise.reject(err);
  });

  axios.interceptors.response.use(function(response) {
  	return response
  }, function(error) {
  	if(error.response.status === 401) {
  		this.$router.push("/")
  	}
  })
}