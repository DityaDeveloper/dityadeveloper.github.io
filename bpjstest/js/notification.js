function validationForm() {
    var title = document.getElementById("title").value;
    var kantor = document.getElementById("kantor").value;
    var status = document.getElementById("status").value;
    var keterangan = document.getElementById("keterangan").value;

    if (!title) {
        alert("title is required!");
        return false;
    }
    if (!kantor) {
        alert("kantor is required!");
        return false;
    }
    if (!status) {
        alert("status is required!");
        return false;
    }
    if (!keterangan) {
        alert("keterangan is required!");
        return false;
    }
    return true;
}

function getOption() {
    selectElement = 
          document.querySelector('#status');
    output = selectElement.value;
    document.querySelector('.output').textContent = output;
}

function showData() {
    var userList;
    if (localStorage.getItem('userList') == null) {
        userList = [];
    } else {
        userList = JSON.parse(localStorage.getItem('userList'));
    }

    var html = "";

    userList.forEach((element, index) => {
        html += "<tr>";
        html += "<td>" + element.title + "</td>";
        html += "<td>" + element.kantor + "</td>";
        html += "<td>" + element.status + "</td>";
        html += "<td>" + element.keterangan + "</td>";
        html += `<td> 
        <button class="btn btn-success" onclick="tampilM(${index})">
            Tampilkan
        </button>
       
        <button class="btn btn-warning m-2" onclick="updateData(${index})">
            Edit
        </button>

        <button class="btn btn-danger" onclick="deleteData(${index})">
        Delete
    </button>
        
        </td>`;
        html += "</tr>";

    });

    document.querySelector("#crudtable tbody").innerHTML = html;
}

document.onload = showData();

function AddData() {
    if (validationForm() == true) {
        var title = document.getElementById("title").value;
        var kantor = document.getElementById("kantor").value;
        var status = document.getElementById("status").value;
        var keterangan = document.getElementById("keterangan").value;
        var userList;
        if (localStorage.getItem('userList') == null) {
            userList = [];
        } else {
            userList = JSON.parse(localStorage.getItem('userList'));
        }

        userList.push({
            title: title,
            kantor: kantor,
            status: status,
            keterangan: keterangan,
        });

        localStorage.setItem('userList', JSON.stringify(userList))
        showData();

        document.getElementById("title").value = "";
        document.getElementById("kantor").value = "";
        document.getElementById("status").value = "";
        document.getElementById("keterangan").value = "";
    }

}

function tampilM(index){
    var userList;
    if (localStorage.getItem('userList') == null) {
        userList = [];
    } else {
        userList = JSON.parse(localStorage.getItem('userList'));
    }

    document.getElementById("kantor").value = userList[index].kantor;

    document.getElementById('marq').innerHTML = document.getElementById("kantor").value;
}

function deleteData(index) {
    var userList;
    if (localStorage.getItem('userList') == null) {
        userList = [];
    } else {
        userList = JSON.parse(localStorage.getItem('userList'));
    }
    userList.splice(index, 1);

    localStorage.setItem('userList', JSON.stringify(userList))
    showData();

}

function updateData(index) {
    document.getElementById("submit").style.display = 'none';
    document.getElementById("update").style.display = 'block';

    var userList;
    if (localStorage.getItem('userList') == null) {
        userList = [];
    } else {
        userList = JSON.parse(localStorage.getItem('userList'));
    }

    document.getElementById("title").value = userList[index].title;
    document.getElementById("kantor").value = userList[index].kantor;
    document.getElementById("status").value = userList[index].status;
    document.getElementById("keterangan").value = userList[index].keterangan;


    document.querySelector("#update").onclick = function () {
        userList[index].title = document.getElementById("title").value;
        userList[index].kantor = document.getElementById("kantor").value;
        userList[index].status = document.getElementById("status").value;
        userList[index].keterangan = document.getElementById("keterangan").value;

        localStorage.setItem('userList', JSON.stringify(userList))
        showData();

        document.getElementById("submit").style.display = 'block';
        document.getElementById("update").style.display = 'none';
        document.getElementById("title").value = "";
        document.getElementById("kantor").value = "";
        document.getElementById("status").value = "";
        document.getElementById("keterangan").value = "";
    }
}
