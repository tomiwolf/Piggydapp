import React, { useState, useEffect } from "react";
import Image from "next/image";
import { useStatus } from "../context/statusContext";

import {
  getMaxMintAmount,
  getTotalSupply,
  getNftPrice,
  mintNFT,
  getSaleState,
} from "../utils/interact";

const HeroPresale = () => {
  const { status, setStatus } = useStatus();

  const [count, setCount] = useState(1);
  const [maxMintAmount, setMaxMintAmount] = useState(0);
  const [totalSupply, setTotalSupply] = useState(0);
  const [nftPrice, setNftPrice] = useState("0.01");
  const [isSaleActive, setIsSaleActive] = useState(false);

  useEffect(() => {
    const prepare = async () => {
      setMaxMintAmount(await getMaxMintAmount());
      setNftPrice(await getNftPrice());
      setIsSaleActive(await getSaleState());
      await updateTotalSupply();
    };

    prepare();
  });

  const updateTotalSupply = async () => {
    const mintedCount = await getTotalSupply();
    setTotalSupply(mintedCount);
  };

  const incrementCount = () => {
    if (count < maxMintAmount) {
      setCount(count + 1);
    }
  };

  const decrementCount = () => {
    if (count > 1) {
      setCount(count - 1);
    }
  };

  const mintPiggy = async () => {
    const { status } = await mintNFT(count);
    setStatus(status);

    // We minted a new emoji face, so we need to update the total supply
    updateTotalSupply();
  };

  return (
    <main id="main" className="h-screen py-70 bg-pattern">

{/* <div className="back">
<Image
            src="/images/rayo.svg"
            width="220"
            height="500"
            alt="rayo"
            className="rayo"
          />
</div> */}

{/* <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 841.9 595.3">
        <g fill="#61DAFB">
          <path d=""/>
          <circle cx="420.9" cy="296.5" r="45.7"/>
          <path d="M520.5 78.1z"/>
        </g>
      </svg>
   */}


<div className="front">
      <div className="container max-w-5xl mx-auto flex flex-col items-center pt-4 heightres">
        <div className="flex flex-col items-center">
          <Image
            src="/images/logo2.svg"
            width="220"
            height="220"
            alt="emoji faces gif"
            className="rounded-md"
          />

        
          {isSaleActive ? (
            <>
              {/* Minted NFT Ratio */}
              <p className="bg-gray-100 rounded-md text-gray-800 font-extrabold text-lg my-4 py-1 px-3">
                <span className="text-pink-600">{`${totalSupply}`}</span> /
                9.876
              </p>

              <div className="flex items-center mt-6 text-3xl font-bold text-gray-200">
            
                <button
                  className="flex items-center justify-center w-12 h-12 bg-transparent rounded-full text-center hover2"
                  onClick={decrementCount}
                >
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    className="w-8 h-8 text-pink-600"
                    fill="none"
                    viewBox="0 0 22 22"
                    stroke="currentColor"
                  >
                    <path
                      strokeLinecap="round"
                      strokeLinejoin="round"
                      strokeWidth="2"
                      d="M20 12H4"
                    />
                  </svg>
                </button>

                <h2 className="mx-14">{count}</h2>

                <button
                  className="flex items-center justify-center w-12 h-12 bg-transparent rounded-full text-black text-center hover2"
                  onClick={incrementCount}
                >
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    className="w-8 h-8 text-pink-600"
                    fill="none"
                    viewBox="0 0 22 22"
                    stroke="currentColor"
                  >
                    <path
                      strokeLinecap="round"
                      strokeLinejoin="round"
                      strokeWidth="2"
                      d="M12 4v16m8-8H4"
                    />
                  </svg>
                </button>

                
              </div>

              <h4 className="mt-2 font-semibold text-center text-white">
                {nftPrice} ETH{" "}
                <span className="text-sm text-gray-300"> + GAS</span>
              </h4>

              {/* Mint Button */}
              <button
                className="mintnowbtn"
                onClick={mintPiggy}
              >
                PRESALE MINT!
              </button>
            </>
          ) : (
            <p className="text-white text-1xl mt-2 spantitle2">
              {" "}
              ???? Sale is not active yet!
            </p>
          )}

          {/* Status */}

          {status && (
            <div className="mt-2 font-semibold text-center text-white latofont">
              {status}
            </div>
          )}
        </div>
      </div>
      </div>
    </main>
  );
};



export default HeroPresale;
