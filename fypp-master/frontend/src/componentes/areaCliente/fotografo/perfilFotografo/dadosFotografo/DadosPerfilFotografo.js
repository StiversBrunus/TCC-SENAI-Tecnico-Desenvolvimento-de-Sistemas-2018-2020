import React, { Component } from 'react'
import api from '../../../../../services/api'
import axios from 'axios'
import '../style.css'
import TabDetalhes from './TabDetalhes'
import { Preview } from './css/styles'


export default class DadosPerfilFotografo extends Component {

    state = {
        fotografo: [],
        nome: '',
        idade: '',
        experiencia: '',
        especialidades: [],
        avaliacao: '',
        nota: '',
        localidade: '',
        uf: '',
        fotoPerfil: '',
        portfolios: []
    }

    // loading = (e) => {
    //     this.props.loading(e)
    // }

    componentDidMount = async () => {
        const { idFotografo } = this.props

        let token = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbkBhZG1pbi5jb20iLCJyb2xlcyI6WyJBRE1JTiJdLCJpYXQiOjE1OTEyNzA5NDEsImV4cCI6MTU5MTM1NzM0MX0.du69f5OTlkCmc6J6okqGdLqLy_xKq4XxESUwuW_mkFpNNa8w-8Mt7-f3pFt_zCJ6TDBY9KYqc-URMvr14BPSog"
        let config = {
            headers: {
                'authorization': token,
                'Access-Control-Allow-Origin': '*'
            }
        }

        await api.get('/photo/fotografos/' + idFotografo)
            .then((res) => {
                // this.buscarCidade(res.data.cep)
                console.log(res.data)
                this.setState({
                    nome: res.data.nome,
                    experiencia: res.data.experiencia,
                    especialidades: res.data.especialidades,
                    fotoPerfil: res.data.fotoPerfil,
                    localidade: res.data.enderecos.cidade,
                    uf: res.data.enderecos.estado,
                    portfolios: res.data.portfolios
                })
                // this.loading(false)              

            }).catch(erro => {
                console.log(erro)
            })
    }

    render() {
        const { especialidades } = this.state
        const { portfolios } = this.state
        return (
            <div className="row" style={{ marginBottom: '0', paddingBottom: '0' }}>
                <div className="container" style={{ marginBottom: '0' }}>
                    <div className="col s4" style={{ backgroundColor: "#641682", height: '71vh', paddingTop: '1em' }}>
                        <Preview src={this.state.fotoPerfil} />
                        <div style={{ paddingTop: '5em' }}>
                            <div className="row center" style={{ marginBottom: '0.2em' }}>
                                <p style={{ color: '#ffffff', fontSize: '18px', fontFamily: 'Montserrat-extrabold', letterSpacing: '1px', textTransform: 'capitalize', marginBottom: '0' }}>{this.state.nome}, 18</p>
                                <p style={{ color: '#ffffff', fontSize: '15px', fontFamily: 'Montserrat-medium', textTransform: 'capitalize', marginTop: '0' }}>{this.state.localidade}, {this.state.uf}</p>

                            </div>

                            <div className="row" style={{ marginBottom: '0' }}>
                                <div className="col s12">
                                    <p style={{ color: '#270833', marginLeft: '1.2em', fontSize: '15px', fontFamily: 'Montserrat-medium', fontWeight: 'bold', textTransform: 'capitalize', marginBottom: '0' }}>especialidades</p>

                                    {especialidades.map((especialidade, index) => (
                                        <h5 key={index} style={{ color: '#FFFFFF', marginLeft: '1.2em', fontSize: '13px', fontFamily: 'Montserrat-medium', textTransform: 'capitalize', marginTop: '5px' }}>
                                            {especialidade.nome}
                                        </h5>
                                    ))}

                                </div>
                            </div>

                            <div className="row" style={{ marginTop: '0', marginBottom: '0' }}>
                                <div className="col s12">
                                    <p style={{ color: '#270833', marginLeft: '1.2em', fontSize: '15px', fontFamily: 'Montserrat-medium', fontWeight: 'bold', textTransform: 'capitalize', marginBottom: '0' }}>Experiência</p>
                                    <p style={{ color: '#ffffff', marginLeft: '1em', fontSize: '16px', fontFamily: 'Montserrat-medium', textTransform: 'capitalize', marginTop: '0' }}>{this.state.experiencia}</p>
                                </div>
                            </div>

                            <div className="row" style={{ marginTop: '0', marginBottom: '0' }}>
                                <div className="col s12">
                                    <p style={{ color: '#270833', marginLeft: '1.2em', fontSize: '15px', fontFamily: 'Montserrat-medium', fontWeight: 'bold', textTransform: 'capitalize', marginBottom: '0' }}>Nota</p>
                                    <p style={{ color: '#ffffff', marginLeft: '1em', fontSize: '16px', fontFamily: 'Montserrat-medium', textTransform: 'capitalize', marginTop: '0' }}>★ ★ ★ ★ ★</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    {/* <div>
                        <div class="carousel">
                            <a class="carousel-item" href="#one!" style={{ width: '100px', height: '100px' }}><img src="https://lorempixel.com/250/250/nature/1" /></a>
                            <a class="carousel-item" href="#two!" style={{ width: '100px', height: '100px' }}><img src="https://lorempixel.com/250/250/nature/2" /></a>
                            <a class="carousel-item" href="#three!" style={{ width: '100px', height: '100px' }}><img src="https://lorempixel.com/250/250/nature/3" /></a>
                            <a class="carousel-item" href="#four!" style={{ width: '100px', height: '100px' }}><img src="https://lorempixel.com/250/250/nature/4" /></a>
                            <a class="carousel-item" href="#five!" style={{ width: '100px', height: '100px' }}><img src="https://lorempixel.com/250/250/nature/5" /></a>
                        </div>
                    </div> */}
                    <TabDetalhes portfolios={portfolios} />
                </div>
            </div>
        )
    }
}
