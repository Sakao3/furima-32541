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
    const html = `
    <div class = "a-comment">
      <div class = "comment-name" >
      ${ data.nickname }
    </div>
    <div class = "comment-contents">
      ${ data.content.comment }
    </div>
    </div>`;
    const commentIndex = document.getElementById('comment_index');
    const newComment = document.getElementById('comment_comment');
    commentIndex.insertAdjacentHTML('afterbegin', html);
    newComment.value='';

    // 二回目以降送信できない問題解消
    const submit = document.getElementById("submit_btn");
    submit.removeAttribute("disabled");
  }
});


