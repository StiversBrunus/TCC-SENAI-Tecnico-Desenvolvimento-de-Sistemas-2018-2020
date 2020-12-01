import React, { Component } from 'react'
import M from 'materialize-css/dist/js/materialize.min.js'
import Select from 'react-select'
import axios from 'axios'
import InputMask from 'react-input-mask';
import api from '../../../../../services/api'

// const options = [
//     { value: 'blues', label: 'Blues' },
//     { value: 'rock', label: 'Rock' },
//     { value: 'jazz', label: 'Jazz' }
//     // { value: 'orchestra' label: 'Orchestra' } 
//   ];

class FormDadosEvento extends Component {
    constructor(props) {
        super(props)
        this.state = {
            starttime: '',
            endtime: '',
            enderecoEvento: '',
            startdate: '',
            pacoteEvento: '',
            valueSelect: '',
            cepEvento: '',
            numeroEvento: '',
            bairroEvento: '',
            cidadeEvento: '',
            estadoEvento: ''
            // categoriaEvento: []
        };

        this.handleSelect = this.handleSelect.bind(this)

        this.startdate = React.createRef();
        this.starttime = React.createRef();
        this.endtime = React.createRef();
    }

    //Handle data
    handleDate = () => {
        this.setState({
            startdate: this.startdate.current.value
        })
    }

    //Handle hora
    handleTime = () => {
        this.setState({
            starttime: this.starttime.current.value,
            endtime: this.endtime.current.value
        })
    }

    handleSelect(event) {
        this.setState({ valueSelect: event.target.value });
    }

    //Handle inputs
    handleChange = (e) => {
        this.setState({
            [e.target.id]: e.target.value
        })
    }

    setStates = (e) => {
        e.preventDefault()
        this.props.setStates(this.state)
    }

    location = () => {
		this.props.location();
	}   

    buscarCep = async (cep) => {
        const cepHifen = cep;
        const cepReplace = cepHifen.replace('-', '')

        await axios.get('https://viacep.com.br/ws/' + cepReplace + '/json/')
            .then((res) => {
                this.setState({
                    estadoEvento: res.data.uf,
                    enderecoEvento: res.data.logradouro,
                    bairroEvento: res.data.bairro,
                    cidadeEvento: res.data.localidade,
                    cepEvento: cepReplace
                })

            }).catch(erro => {
                console.log(erro)
            })
    }

    componentDidMount() {
        var context = this;
        document.addEventListener('DOMContentLoaded', function () {
            var elemstime = document.querySelectorAll('.timepicker');
            M.Timepicker.init(elemstime, {
                twelveHour: false,
                i18n: { cancel: "sair", done: "OK" },
                onCloseEnd: context.handleTime
            });

            var elems = document.querySelectorAll('.datepicker');
            M.Datepicker.init(elems, {
                format: 'dd / mm / yyyy',
                cancel: 'Sair',
                today: "Hoje",
                onClose: context.handleDate,
                i18n: {
                    weekdays: ['Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado'],
                    monthsShort: ['jan', 'fev', 'mar', 'abr', 'maio', 'jun', 'jul', 'ago', 'set', 'out', 'nov', 'dez'],
                    months: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
                    weekdaysShort: ['Dom', 'Seg', 'Terç', 'Qua', 'Qui', 'Sex', 'Sab'],
                    weekdaysAbbrev: ['D', 'S', 'T', 'Q', 'Q', 'S', 'S'],
                    cancel: 'Sair'
                }
            });
        });

    }


    render() {
        const { categoriaEvento } = this.props


        return (
            <div className="row" style={{ padding: '1em', marginBottom: '0em',paddingTop:'0.2em',paddingLeft: '2em', paddingBottom:'0em', paddingRight:'2em', backgroundColor: '#ffffff', borderRadius: '5px', marginBottom:'0em'}}>
                <div className="col s12">
                    <div className="row">
                        <form className="col s12" autoComplete="off">
                            <div className="row">
                                <div className="input-field col s3">
                                    <InputMask id="cepEvento" type="text" className="validate" onChange={(e) => this.buscarCep(e.target.value)} mask="99999-999" />
                                    <label htmlFor="cepEvento">CEP do evento:</label>
                                </div>

                                <div className="input-field col s6">
                                    <input id="enderecoEvento" type="text" disabled placeholder="Endereço:" className="validate" value={this.state.enderecoEvento} onChange={this.handleChange} />
                                    {/* <label htmlFor="enderecoEvento">Endereço do evento:</label> */}
                                </div>

                                <div className="input-field col s3">
                                    <input id="numeroEvento" type="text" className="validate" value={this.state.numeroEvento} onChange={this.handleChange} />
                                    <label htmlFor="numeroEvento">Número do evento:</label>
                                </div>
                            </div>

                            <div className="row">
                                <div className="input-field col s5">
                                    <input id="bairroEvento" type="text" disabled placeholder="Bairro:" className="validate" value={this.state.bairroEvento} onChange={this.handleChange} />
                                    {/* <label htmlFor="bairroEvento">Bairro do evento:</label> */}
                                </div>

                                <div className="input-field col s5">
                                    <input id="cidadeEvento" type="text" disabled placeholder="Cidade" className="validate" value={this.state.cidadeEvento} onChange={this.handleChange} />
                                    {/* <label htmlFor="cidadeEvento">Cidade do evento:</label> */}
                                </div>

                                <div className="input-field col s2">
                                    <input id="estadoEvento" type="text" disabled placeholder="Estado:" className="validate" value={this.state.estadoEvento} onChange={this.handleChange} />
                                    {/* <label htmlFor="estadoEvento">Estado do evento:</label> */}
                                </div>
                            </div>

                            <div className="row">
                                <div className="input-field col s4">
                                    <input id="startdate" type="text" className="datepicker" ref={this.startdate} />
                                    <label htmlFor="startdate">Data do evento:</label>
                                </div>

                                <div className="input-field col s4">
                                    <input id="starttime" type="text" className="timepicker" ref={this.starttime} />
                                    <label htmlFor="starttime">Hora inicio:</label>
                                </div>

                                <div className="input-field col s4">
                                    <input id="endtime" type="text" className="timepicker" ref={this.endtime} />
                                    <label htmlFor="endtime">Hora Fim:</label>
                                </div>

                            </div>

                            <div className="row">
                                <div className="input-field col s6">
                                    {/* <input id="pacoteEvento" type="text" className="validate" value={this.state.pacoteEvento} onChange={this.handleChange} /> */}
                                    <select id='pacoteFotografo'>
                                        <option disabled value=''>Escolha um pacote</option>
                                    </select>
                                    <label htmlFor="pacoteEvento">Pacote:</label>
                                </div>
                                <div className="input-field col s6">
                                    <select id='categoriaFotografo' onChange={this.handleSelect}>
                                        <option disabled value=''>Escolha uma categoria</option>
                                        {console.log(categoriaEvento)}
                                        {categoriaEvento.map((categoria, index) => 
                                            <option key={index} value={categoria.id}>{categoria.nome}</option>
                                        )}
                                        {/* {console.log(this.state.categoriaEvento)} */}
                                    </select>
                                    <label>Categoria</label>
                                </div>
                            </div>

                            {/* <div className="row">
                                <div className="input-field col s3">
                                    <input id="startdate" type="text" className="datepicker" ref={this.startdate} />
                                    <label htmlFor="startdate">Data do evento:</label>
                                </div>
                            </div>

                            <div className="row">
                                <div className="input-field col s6">
                                    <input id="starttime" type="text" className="timepicker" ref={this.starttime} />
                                    <label htmlFor="starttime">Hora inicio:</label>
                                </div>
                                <div className="input-field col s6">
                                    <input id="endtime" type="text" className="timepicker" ref={this.endtime} />
                                    <label htmlFor="endtime">Hora Fim:</label>
                                </div>
                            </div> */}
                            <div className="row">
                                <div className="col s6 right">
                                    <button style={{ marginRight:'3em' }} onClick={this.setStates} className="waves-effect waves-light btn right">
                                        <i className="material-icons right">
                                            arrow_forward
                                        </i>Próximo
                                    </button>
                                </div>
                                <div className="col s6 left">
                                    <button style={{ marginLeft:'3em' }} onClick={this.location} className="waves-effect waves-light btn left">
                                        <i className="material-icons left">
                                            arrow_back
                                        </i>Voltar
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        )
    }
}

export default FormDadosEvento
