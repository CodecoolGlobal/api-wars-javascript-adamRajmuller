let planetHeader = `<tr>
                    <thead class="thead-dark">
                        <th>Name</th>
                        <th>Diameter</th>
                        <th>Climate</th>
                        <th>Terrain</th>
                        <th>Surface Water</th>
                        <th>Population</th>
                        <th>Residents</th>
                    </thead>
                   </tr>`;



export function drawPlanetTable(planets) {
    document.querySelector('#loading').innerText = '';
    let innerHtml = planetHeader;
    for (let i in planets) {
        innerHtml += `
            <tr>
                <td>${planets[i].name}</td>
                <td>${planets[i].diameter} km</td>
                <td>${planets[i].climate}</td>
                <td>${planets[i].terrain}</td>
                <td>${(planets[i].surface_water !== 'unknown') ? `${planets[i].surface_water}%` : 'Unknown'}</td>
                <td>${(planets[i].population === 'unknown') ? 'Unkown' : `${planets[i].population} people`}</td>
                <td>${(planets[i].residents.length > 0) ?
                `<button type='button' class="btn btn-warning" class="btn btn-primary" data-toggle="modal" data-target="#residents-modal"   data-residents=${planets[i].residents}>${planets[i].residents.length} resident(s)</button>` : 'No residents'}</td>
            </tr>
`;
    }
    document.querySelector('#table').innerHTML = innerHtml;
}

