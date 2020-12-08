const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  form.addEventListener("submit",(e) => {
    e.preventDefault();
    // ここまではうまく行っている

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("item_order[number]"),
      exp_month: formData.get("item_order[exp_month]"),
      exp_year: `20${formData.get("item_order[exp_year]")}`,
      cvc: formData.get("item_order[cvc]"),
    };

    // console.log(card);
    // カード情報を確実に取得しているの確認、中に数字入れるとその数字もしっかり読み込んでいる

    // ここから402のエラー→年のところにJS側で頭に２０を入れるとうまくトークン化できる

    Payjp.createToken(card, (status, response) => {
      if (status == 200 ) {
        const token = response.id;
        // トークン作成成功
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        // トークンをフォームに追加完了
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");

      document.getElementById("charge-form").submit();
      // ちゃんと入力している時トークンの送信成功、パラムスの中身確認済
    });
  });
};

window.addEventListener("load", pay);
