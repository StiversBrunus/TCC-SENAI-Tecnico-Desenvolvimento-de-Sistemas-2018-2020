import styled, { css } from "styled-components";

const dragActive = css`
  border-color: #78e5d5;
`;

const dragReject = css`
  border-color: #e57878;
`;

export const DropContainer = styled.div.attrs({
    className: "dropzone"
})`
  border: 1px dashed #ddd;
  border-radius: 4px;
  cursor: pointer;
  transition: height 0.2s ease;
  ${props => props.isDragActive && dragActive};
  ${props => props.isDragReject && dragReject};
`;

const messageColors = {
    default: "#999",
    error: "#e57878",
    success: "#78e5d5"
};

export const UploadMessage = styled.p`
    height:30px;
    display: flex;
    color: ${props => messageColors[props.type || "default"]};
    justify-content: center;
    align-items: center;
    padding: 15px 0;
`;

export const Titulo = styled.h5`
    font-size: 30px;
    font-family: Montserrat-extrabold;
    color: rgb(255, 255, 255);
    cursor: default;
`

export const Subtitulo = styled.h5`
    font-size: 17px;
    font-family: Montserrat-light;
    color: rgb(255, 255, 255);
    cursor: default;
`