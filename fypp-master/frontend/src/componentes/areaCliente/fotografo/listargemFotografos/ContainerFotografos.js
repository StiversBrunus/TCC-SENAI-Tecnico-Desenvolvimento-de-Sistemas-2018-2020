import React, { Component } from 'react'
import Navbar from '../../Navbar'
// import Swal from 'sweetalert2'
import { alertError } from '../../../alerts/alert'
import CardFotografo from './CardFotografo'
import Loading from '../../../loading/Loading'

document.addEventListener('DOMContentLoaded', function () {
    const M = window.M;
    var elems = document.querySelectorAll('select');
    var instances = M.FormSelect.init(elems, {});
});

class Categoria extends Component {

    constructor(props) {
        super(props)
    }

    // state = {
    //     loading: true
    // }

    alertError = () => {
		alertError('Erro','Ops! Tivemos algum problema, por favor tente novamente')
    }

    // handleChange = input => e => {
	// 	this.setState({ [input]: e.target.value });
    // };
    // loading = (eaaaa) => {
    //     this.setState({
    //         loading: eaaaa
    //     })
    // }
    

    // dropdownChanged(e){
    //     e.preventDefault();
    //     this.setState({selectedId: e.target.value});
    //     console.log(this.state.selectedId)
    //     console.log( e.target.value)
    //   }



    // AREA QUE SERA RENDERIZADO TODOS OS CARDS DOS FOTOGRAFOS
    render() {
        return (
            <div>
                {/* {this.state.loading == true ? <Loading/> : */}
                <div>
                <Navbar />
                <div id="container-index-fotografo">
                    <div className="container">
                        <div className="row">
                            <div className="col l10 s12 m12 offset-l2 offset-m0 offset-s0 ">
                                <div className="row">
                                    <div className="col s12 m12 l12" >
                                        <h4 className="valign-wrapper " style={{ cursor: 'default', color: '#641682', fontSize: '30px', fontFamily: "Montserrat-extrabold" }}>
                                            <i className="small material-icons left" style={{ color: '#641682' }}>
                                                camera_alt
                                            </i>Fotógrafos
                                        </h4>
                                    </div>

                                    {/* <div class="input-field col s6">
                                        <select value={this.selectedId} onChange={this.dropdownChanged.bind(this)}>
                                            <option value="default" disabled selected>Filtros:</option>
                                            <option value="1">Option 1</option>
                                            <option value="2">Option 2</option>
                                            <option value="3">Option 3</option>
                                        </select>
                                    </div> */}
                                    <CardFotografo alertError={this.alertError} loading={this.loading}/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
                {/* } */}
            </div>
        )
    }
}

export default Categoria;
