import React, { Component } from 'react'
import M from 'materialize-css'

class TabDetalhes extends Component {

    componentDidMount(){
        let el = document.querySelector('.tabs')
        let intance = M.Tabs.init(el, {
            // swipeable: 'true'
        })

        document.addEventListener('DOMContentLoaded', function() {
            var elems = document.querySelectorAll('.carousel');
            var instances = M.Carousel.init(elems, {});
          });

        var instancee = M.Carousel.init({
            fullWidth: true
          });
    }

    render() {
        return (
            <div>
                <div className="col s8">
                    <div className="row">
                        <div className="col s12">
                            <ul className="tabs">
                                <li className="tab col s3"><a className="active" href="#orcamentosFotografo">Planos</a></li>
                                <li className="tab col s3"><a href="#test2">Port. 01</a></li>
                                <li className="tab col s3"><a href="#test3">Port. 02</a></li>
                                <li className="tab col s3"><a href="#test4">Port. 03</a></li>
                            </ul>
                        </div>
                        <div id="orcamentosFotografo" className="col s12" style={{backgroundColor:'red'}}>Planos</div>
                        <div id="test2" className="col s12" >
                        <div>
                        <div class="carousel">
                            <a class="carousel-item" href="#one!" style={{ width: '100px', height: '100px' }}><img src="https://lorempixel.com/250/250/nature/1" /></a>
                            <a class="carousel-item" href="#two!" style={{ width: '100px', height: '100px' }}><img src="https://lorempixel.com/250/250/nature/2" /></a>
                            <a class="carousel-item" href="#three!" style={{ width: '100px', height: '100px' }}><img src="https://lorempixel.com/250/250/nature/3" /></a>
                            <a class="carousel-item" href="#four!" style={{ width: '100px', height: '100px' }}><img src="https://lorempixel.com/250/250/nature/4" /></a>
                            <a class="carousel-item" href="#five!" style={{ width: '100px', height: '100px' }}><img src="https://lorempixel.com/250/250/nature/5" /></a>
                        </div>
                    </div>
                        
                            {/* <div class="carousel carousel-slider">
                                <a class="carousel-item" href="#one!"><img src="https://upload.wikimedia.org/wikipedia/commons/6/68/Solid_black.png"/></a>
                                <a class="carousel-item" href="#two!"><img src="https://upload.wikimedia.org/wikipedia/commons/6/68/Solid_black.png"/></a>
                                <a class="carousel-item" href="#three!"><img src="https://lorempixel.com/800/400/food/3"/></a>
                                <a class="carousel-item" href="#four!"><img src="https://lorempixel.com/800/400/food/4"/></a>
                            </div> */}
                        </div>
                        <div id="test3" className="col s12" style={{backgroundColor:'green'}}>02</div>
                        <div id="test4" className="col s12" style={{backgroundColor:'orange'}}>03</div>
                    </div>
                </div>
            </div>
        )
    }
}

export default TabDetalhes
