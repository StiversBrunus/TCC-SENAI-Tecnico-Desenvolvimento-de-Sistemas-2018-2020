import React, { Component } from 'react'
import { Container } from './css/style'

class Loading extends Component {
    render() {
        return (
            <Container>
                <div className="row center">
                    <div className="col l10 s12 m12 offset-l2 offset-m0 offset-s0 ">
                        <div className="preloader-wrapper small active">
                            <div className="spinner-layer" style={{ borderColor: "#FFFFFF" }}>
                                <div className="circle-clipper left">
                                    <div className="circle"></div>
                                </div>
                                <div className="gap-patch">
                                    <div className="circle"></div>
                                </div>
                                <div className="circle-clipper right">
                                    <div className="circle"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </Container>

        )
    }
}

export default Loading