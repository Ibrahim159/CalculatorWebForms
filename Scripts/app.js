let inputnum = document.getElementById("body_input_number");
let enter = document.getElementById("body_BtnEnter");
let clear = document.getElementById("body_clear");

function getButtonValue(BtnValue) {
    inputnum.value += BtnValue;
}

enter.addEventListener("click", () => {
    let input_value = inputnum.value;
    let result = 0, operation, flag = false;
    localStorage['operation'] = JSON.stringify({ OperacionJson: input_value });
    

    if (input_value.includes('+')) {
        operation = input_value.split('+');
        operation = operation.map(x => parseFloat(x));

        for (let i = 0; i < operation.length; i++) {
            result += operation[i];
        }

        inputnum.value = result;
        inputnum.textContent = result;
    }

    if (input_value.includes('-')) {
        operation = input_value.split('-');
        operation = operation.map(x => parseFloat(x));

        for (let i = 0; i < operation.length; i++) {
            if (result == 0 && flag == false) {
                result = operation[i];
                continue;
            }
            flag = true;
            result -= operation[i];
        }
        flag = false;
        inputnum.value = result;
    }

    if (input_value.includes('X')) {
        operation = input_value.split('X');
        operation = operation.map(x => parseFloat(x));

        for (let i = 0; i < operation.length; i++) {
            if (result == 0 && flag == false) {
                result = operation[i];
                continue;
            }
            flag = true;
            result *= operation[i];
        }
        flag = false;
        inputnum.value = result;
    }

    if (input_value.includes('/')) {
        operation = input_value.split('/');
        operation = operation.map(x => parseFloat(x));

        for (let i = 0; i < operation.length; i++) {
            if (result == 0 && flag == false) {
                result = operation[i];
                continue;
            }
            flag = true;
            result /= operation[i];
        }
        flag = false;
        inputnum.value = result;
    }

    $.ajax({
        type: "POST",
        url: "/Pages/Index.aspx/GetOperacion",
        data: JSON.stringify({OperacionJson: localStorage['operation'] }),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (msg) {
            console.log(msg.d);
        },
        error: function (msg) {
            alert("Message call failed");
            console.log(msg);
        }
    });

});

clear.addEventListener("click", () => {
    inputnum.value = '';
});