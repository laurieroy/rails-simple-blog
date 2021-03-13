// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

const Trix = require("trix")
require("@rails/actiontext")

const Chart = require("chart.js")

Trix.config.blockAttributes.heading1.tagName = "h3";


import "controllers"
import Sortable from "sortablejs"

import '../stylesheets/application';

document.addEventListener('turbolinks:load', () => {
	var ctx = document.getElementById('page-views');
	var myChart = new Chart(ctx, {
		type: 'line',
		data: {
			labels: JSON.parse(ctx.dataset.labels),
			datasets: [{
				label: 'Daily Page Views',
				data: JSON.parse(ctx.dataset.data)				,
				borderWidth: 1
			}]
		},
	});

	var ctx = document.getElementById('uniq-page-views');
	var myChart = new Chart(ctx, {
		type: 'line',
		data: {
			labels: JSON.parse(ctx.dataset.labels),
			datasets: [{
				label: 'Unique Daily Page Views',
				data: JSON.parse(ctx.dataset.data)				,
				borderWidth: 1
			}]
		},
	});

	document.addEventListener('click', () => {
		let element = event.target.closest('.paragraph-content')
		if (!element) return;

		element.classList.add('d-none')
		element.nextElementSibling.classList.remove('d-none')
	})

	document.addEventListener('click', () => {
		if (!event.target.matches('.cancel')) return;
		event.preventDefault()
		
		let element = event.target.closest('.paragraph-form')

		element.classList.add('d-none')
		element.previousElementSibling.classList.remove('d-none')
	})

	let sortable_element = document.getElementById('elements')
	Sortable.create(sortable_elements, { animation: 150 })
})


