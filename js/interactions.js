
let username = prompt("Como você quer ser chamado?");
let currentTime = axios.get('http://worldtimeapi.org/api/timezone/America/Sao_Paulo');
let chat = document.getElementsByClassName('chat')[0];

console.log(currentTime);
time = currentTime.then(processDateResponse); 
console.log(time);
currentTime.catch(processError);
    
function processDateResponse(time) { 
    time = time.data.datetime.slice(11,19);
    chat.innerHTML += `
    <div class = 'message member_flux'> (${time}) ${username} entra na sala... </div>
    `;
    return time;}
    
function processError(error) {
    console.log("Status Code: " + error.response.status); // Ex: 404
    console.log("Error Message: " + error.response.data); // Ex: Not Found
}