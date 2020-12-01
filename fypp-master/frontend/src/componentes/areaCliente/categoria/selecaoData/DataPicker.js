import React, { Component } from 'react'

class DataPicker extends Component {    
    console = () => {
        console.log('hi')
    }

    componentDidMount(){
        // var data = new Date();
        document.addEventListener('DOMContentLoaded', function() {
            const M = window.M;
            var elems = document.querySelectorAll('.datepicker');
            var instances = M.Datepicker.init(elems, {
                format:'dd / mmm / yyyy',
                cancel:	'Sair',
                today: "Hoje",
                onSelect: function(data){
                    console.log(data)
                },
                i18n: {
                    weekdays:
                            [
                                'Domingo',
                                'Segunda',
                                'Terça',
                                'Quarta',
                                'Quinta',
                                'Sexta',
                                'Sabad'
                            ],
                    monthsShort:
                            [
                                'jan',
                                'fev',
                                'mar',
                                'abr',
                                'maio',
                                'jun',
                                'jul',
                                'ago',
                                'set',
                                'out',
                                'nov',
                                'dez'
                            ],
                    months:
                            [
                                'Janeiro',
                                'Fevereiro',
                                'Março',
                                'Abril',
                                'Maio',
                                'Junho',
                                'Julho',
                                'Agosto',
                                'Setembro',
                                'Outubro',
                                'Novembro',
                                'Dezembro'
                            ],
                    weekdaysShort:	
                            [
                                'Dom',
                                'Seg',
                                'Terç',
                                'Qua',
                                'Qui',
                                'Sex',
                                'Sab'
                            ],
                    weekdaysAbbrev:
                            [
                                'D',
                                'S',
                                'T',
                                'Q',
                                'Q',
                                'S',
                                'S'
                            ],
                    cancel:'Sair'
                }          
            });
        });
    }

    inputHandler = (event) => {
		const { name, value } = event.target;
		this.setState({ [name]: value });
    }
    
    render() {
        return (
            <div className="col s6">
                <input type="text" placeholder="DD / MM / AAAA" className="col s12 datepicker center-align" style={{ color:'#ffffff', fontFamily: "Montserrat", fontSize: '25px',height:'2em', padding:'2px', boxSizing:'border-box'}}/>
            </div>
        )
    }
}

export default DataPicker
