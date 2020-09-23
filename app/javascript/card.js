const pay = () => {
  Payjp.setPublicKey("pk_test_e60eabd91561435dd8e2df90");
  const form = document.getElementById("credit-card-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
 
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
 
    const card = {
      number: formData.get("shipping[number]"),
      exp_month: formData.get("shipping[exp_month]"),
      exp_year: `20${formData.get("shipping[exp_year]")}`,
      cvc: formData.get("shipping[cvc]"),
    };
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("credit-card-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("card-number").removeAttribute("id");
      document.getElementById("card-exp-month").removeAttribute("id");
      document.getElementById("card-exp-year").removeAttribute("id");
      document.getElementById("card-cvc").removeAttribute("id");
 
      document.getElementById("charge-form").submit();
      document.getElementById("charge-form").reset();
    });
  });
 };
 
 window.addEventListener("load", pay);