import React, { Component } from 'react'
import api from '../../../../services/api'
import { Link } from 'react-router-dom'
import axios from 'axios'
import { Preview } from './css/style'
import Loading from '../../../loading/Loading'

class CardFotografo extends Component {

    alertError = e => {
        this.props.alertError();
    }

    state = {
        fotografos: [],
        loading: true
    }

    componentDidMount = async () => {
        let token = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbkBhZG1pbi5jb20iLCJyb2xlcyI6WyJBRE1JTiJdLCJpYXQiOjE1OTEyNzA5NDEsImV4cCI6MTU5MTM1NzM0MX0.du69f5OTlkCmc6J6okqGdLqLy_xKq4XxESUwuW_mkFpNNa8w-8Mt7-f3pFt_zCJ6TDBY9KYqc-URMvr14BPSog"
        let config = {
            headers: {
                'authorization': token,
                'Access-Control-Allow-Origin': '*'
            }
        }

        await api.get('/photo/fotografos'
            // , config
        )
            .then((res) => {
                this.setState({
                    fotografos: res.data.content,
                    loading: false
                })
            }).catch(erro => {
                console.log(erro)
                this.alertError();
            })
    }

    render() {
        const fotografos = this.state.fotografos;

        //CARD COM AS INFORMAÇÕES BASICAS DOS FOTOGRAFOS
        return (
            <div>
                {this.state.loading == true ? <Loading /> :
                    <div>
                        {fotografos.map((fotografo, index) => (
                            <div className="col s12 m6 l6" key={index}>
                                <div className="card" style={{ height: '210px' }}>
                                    <div className="card-content white-text " style={{ cursor: "default" }}>
                                        <div className="row valign-wrapper">
                                            <div className="col s4 center">
                                                <Preview src={fotografo.fotoPerfil} />
                                            </div>
                                            <div className="col s8 center">
                                                <p style={{ color: '#641682', fontFamily: 'Montserrat-medium', textTransform: 'capitalize' }}>{fotografo.nome}, 18</p>
                                                <p style={{ color: '#000000', fontFamily: 'Montserrat-medium', textTransform: 'capitalize' }}>{fotografo.enderecos.cidade}, {fotografo.enderecos.estado}</p>
                                                <p style={{ color: '#000000', fontFamily: 'Montserrat-medium', textTransform: 'capitalize' }}>{fotografo.experiencia}</p>
                                                <p style={{ color: 'orange', fontSize: '15px' }}> ★ ★ ★ ★ ★</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div className="row">
                                        <div className="card-action right">
                                            <Link to={"/cliente/fotografos/" + fotografo.id} style={{ color: '#641682' }}>detalhes</Link>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        ))}
                    </div>
                }
            </div>
        )
    }
}

export default CardFotografo 
