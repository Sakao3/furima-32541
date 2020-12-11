// function comment(){
//   const submit = document.getElementById("submit_btn");
//   submit.addEventListener('click',(e)=>{
//     const formData = new FormData(document.getElementById("form"));
//     const XHR = XMLHttpRequest();
//     XHR.open("POST","/items/${comment.item}",true);
//     XHR.responseType = "json";
//     XHR.send(formData);

//     XHR.onload = ()=>{
//       const item = XHR.response.comment;
//       const commentBox = document.getElementById("comment_box");
//       const commentComment = document.getElementById("comment_comment");
//       const HTML =`
//       <div>
//         ${ item.comment }
//       </div>`;
//       commentBox.insertAdjacentHTML("afterbegin",HTML);
//       commentComment.value = "";
//     };

//     e.preventDefault();
//   })
// }

// window.addEventListener('load',comment);