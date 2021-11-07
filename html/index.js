// Copyright (C) 2021 Sub-Zero Interactive

// All rights reserved.

// Permission is hereby granted, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software with 'All rights reserved'. Even if 'All rights reserved' is very clear :

//   You shall not sell and/or resell this software
//   The rights to use, modify and merge
//   The above copyright notice and this permission notice shall be included in all copies and files of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

$(function () {
    function display(bool) {
        if (bool) {
            $("#container").show();
        } else {
            $("#container").hide();
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }else if(item.type === 'data'){
            $('#tint').text(item.tint)
            $('#tint').css("color", `var(${item.textColor})`)
        }
    })

    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('http://szi_windowtint/exit', JSON.stringify({}));
            return
        }
    };
})