//Get the modal elements
var modal = document.getElementById('simplemodal');
//Get open modal button
var modalBtn = document.getElementById('modalBtn');
//Get close modal butto
var closeBtn = document.getElementsByClassName('closeBtn')[0];

//Listen for click
modalBtn.addEventListener('click',openModal);
//Listen for click
closeBtn.addEventListener('click',closeModal);
//Outside
window.addEventListener('click',clickOutside);

//Function to open modal
function openModal(){
    modal.style.display='block';
}
//Function to close modal
function closeModal(){
    modal.style.display='none';
}
//Function to close from outside

function clickOutside(e){
    if(e.target==modal){
    modal.style.display='none';
}
    }
