import {drawPlanetTable} from './dom.js'


function fetchPlanet(url) {
    fetch(url)  // set the path; the method is GET by default, but can be modified with a second parameter
    .then(function (response) {
        return response.json();
    })  // parse JSON format into JS object
    .then(function (data) {
        drawPlanetTable(data.results);

        let listenerNext = function(){
            document.querySelector('#btn-next').removeEventListener('click', listenerNext);
            document.querySelector('#btn-previous').removeEventListener('click', listenerPrevious);
            fetchPlanet(data.next);
        };
        let listenerPrevious = function(){
            document.querySelector('#btn-next').removeEventListener('click', listenerNext);
            document.querySelector('#btn-previous').removeEventListener('click', listenerPrevious);
            fetchPlanet(data.previous);
        };

        document.querySelector('#btn-next').addEventListener('click', listenerNext);
        document.querySelector('#btn-previous').addEventListener('click', listenerPrevious);
})}


function getPlanetUrl(page) {
    return `https://swapi.co/api/planets/?page=${page}`
}


function main() {
    let currentPage = 1;
    let planetUrl = getPlanetUrl(currentPage);
    fetchPlanet(planetUrl);
}


main();