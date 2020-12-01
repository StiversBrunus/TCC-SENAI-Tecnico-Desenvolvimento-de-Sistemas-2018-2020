import React, { Component } from 'react'

document.addEventListener('DOMContentLoaded', function() {
    const D = window.M;
    var elems = document.querySelectorAll('.timepicker');
    var instances = D.Timepicker.init(elems, {
        twelveHour:false,
        onSelect: function(hora, min){
            console.log(hora,min)
        },
        i18n:{
            cancel:"sair",
            done: "OK" 
        }
    });
});


class DataPickerHora extends Component {
    render() {

        return (
            <div className="col s4">
                <input type="text" placeholder="HH : MM " class="col s12 timepicker center-align" style={{ color:'#ffffff', fontFamily: "Montserrat", fontSize: '25px',height:'2em', padding:'2px', boxSizing:'border-box'}}/>
            </div>
        )
    }
}

export default DataPickerHora ;
