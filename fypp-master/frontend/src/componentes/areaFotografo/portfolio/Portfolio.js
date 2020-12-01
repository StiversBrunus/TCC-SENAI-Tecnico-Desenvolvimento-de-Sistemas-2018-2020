import React, { Component } from 'react'
import Navbar from '../Navbar'
import M from 'materialize-css'
import { Link } from 'react-router-dom'

class Portfolio extends Component {

    componentDidMount(){
        document.addEventListener('DOMContentLoaded', function() {
            var elems = document.querySelectorAll('.tooltipped');
            var instances = M.Tooltip.init(elems, {});
          });
    }

    render() {
        return (
            <div>
                <Navbar/>
                <div>
                    <div className="container">
                        <div className="row">
                            <div className="col l10 s12 m12 offset-l2 offset-m0 offset-s0 ">
                                <div className="row">
                                    <div id="div-slogan" className="col l12" >
                                        <h4 className="valign-wrapper" style={{color:'#641682',fontSize:'30px', fontFamily:"Montserrat-extrabold"}}>
                                            <i className="small material-icons left" style={{color:'#641682'}}>
                                                photo_camera
                                            </i>Portfólio
                                        </h4>
                                    </div>
                                    <div className="col s12">
                                        <Link to="/fotografo/portfolio/nome" className="btn-floating btn-large waves-effect waves-light tooltipped" data-position="top" data-tooltip="Criar um portfólio" style={{color:'#641682', position:'absolute', marginTop:'32em', marginLeft:'42em'}}><i className="material-icons">add</i></Link>
                                    </div>
                                </div>
                            </div>                            
                        </div>
                    </div>
                </div>
            </div>
        )
    }
}

export default Portfolio;
