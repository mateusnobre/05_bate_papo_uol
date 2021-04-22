function processError(error) {
    console.log("Status Code: " + error.response.status); // Ex: 404
    console.log("Error Message: " + error.response.data); // Ex: Not Found
}

let username = prompt("Como você quer ser chamado?");

logUserStatus = axios.post('https://mock-api.bootcamp.respondeai.com.br/api/v2/uol/participants', {name: username})
logUserStatus.catch(processError);

setInterval(updateUserStatus, 5000);
setInterval(getMessages, 500);
function updateUserStatus(){
    console.log(username);
    status = axios.post('https://mock-api.bootcamp.respondeai.com.br/api/v2/uol/status', {name: username});
}
function getMessages(){};
function sendMessage(username, message, dest = 'Todos', type = 'message'){
    let messageJSON = {
        from: username,
        to: dest,
        text: message,
        type: type
    }
    message_status = axios.post('https://mock-api.bootcamp.respondeai.com.br/api/v2/uol/messages', messageJSON);
};
let currentTime = axios.get('http://worldtimeapi.org/api/timezone/America/Sao_Paulo');
let chat = document.getElementsByClassName('chat')[0];
let sendButton = document.getElementsByClassName('send_icon')[0];

time = currentTime.then(processDateResponse); 
currentTime.catch(processError);

function processDateResponse(time) { 
    time = time.data.datetime.slice(11,19);
    chat.innerHTML += `
    <div class = 'message member_flux'> (${time}) ${username} entra na sala... </div>
    `;
    return time;}
    