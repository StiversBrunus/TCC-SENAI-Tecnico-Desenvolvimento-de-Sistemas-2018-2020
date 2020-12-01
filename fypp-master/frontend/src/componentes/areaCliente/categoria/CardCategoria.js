import React, { Component } from 'react'
import api from '../../../services/api'
import { Link } from 'react-router-dom'
import { Preview } from './css/style'
import Loading from '../../loading/Loading'

class CardCategoria extends Component {

    alertError = () => {
        this.props.alertError();
    }

    state = {
        categorias: [],
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

        await api.get('/photo/especialidades'
            // , config
        )
            .then((res) => {
                this.setState({
                    categorias: res.data.content,
                    loading: false
                })
            }).catch(erro => {
                console.log(erro)
                this.alertError();
            })
    }

    render() {
        const categorias = this.state.categorias;

        return (
            <div>
                {this.state.loading == true ? <Loading /> :
                    <div>
                        {categorias.map((categoria, index) => (
                            <div className="col s12 m4 l3" key={index} >
                                <div className="card-panel waves-effect waves-block waves-light" style={{ boxSizing: 'border-box', height: "240px" }}>
                                    <div className="row valign-wrapper">
                                        <div className="col l12" style={{ marginLeft: 'auto', marginRight: 'auto' }}>
                                            <Preview src={categoria.imagem} />
                                        </div>
                                    </div>
                                    <div className="row valign-wrapper">
                                        <div className="col l12 center">
                                            <Link to={"/cliente/categorias/" + categoria.id + "/data"} style={{ fontFamily: 'Montserrat-regular' }}>{categoria.nome}</Link>
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

export default CardCategoria
