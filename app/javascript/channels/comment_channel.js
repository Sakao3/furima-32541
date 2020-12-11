import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel

    // 自分でコメントアウト
    // const html = `<div>
    //               ${data.content.comment}
    //               ${data.content.user_id.nickname}
    //               </p>`;
    // const comments = document.getElementById('comment_box');
    // const newComment = document.getElementById('comment_comment');
    // comments.insertAdjacentHTML('afterbegin', html);
    // newComment.value='';


  }
});
