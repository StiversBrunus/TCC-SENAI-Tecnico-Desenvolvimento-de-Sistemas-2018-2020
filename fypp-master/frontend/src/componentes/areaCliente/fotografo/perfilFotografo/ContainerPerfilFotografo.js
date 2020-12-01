import React, { Component } from 'react'
import { Navbar, BannerBotao } from './Navbar'
import DadosPerfilFotografo from './dadosFotografo/DadosPerfilFotografo'
import LoadingFullScreen from '../../../loading/LoadingFullScreen'

class ContainerPerfilFotografo extends Component {
    constructor(props) {
        super(props);
    }

    state = {
        idFotografo: '',
        // loading: ""
    }

    componentDidMount() {
        let id = this.props.match.params.idFotografo

        this.setState({
            idFotografo: id
        })
    }

    // loading = (e) => {
    //     this.setState({
    //         loading: e
    //     })
        
    // }

    render() {
        return (
            <div>
                {/* {this.state.loading == true ? <LoadingFullScreen /> :  */}
                    <div className="row" style={{ marginBottom: '0' }}>
                        <Navbar idFotografo={this.props.match.params.idFotografo} />
                        {/* {console.log(this.state.loading)} */}
                        <BannerBotao idFotografo={this.props.match.params.idFotografo} />
                        <DadosPerfilFotografo loading={this.loading} idFotografo={this.props.match.params.idFotografo} />
                    </div>
                {/* } */}
            </div>
        )
    }
}

export default ContainerPerfilFotografo;
