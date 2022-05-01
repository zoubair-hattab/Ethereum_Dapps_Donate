import contract from "@truffle/contract"

export const loadContract =  async (name ,provider)=>{
const contractFile = await  fetch(`/abis/${name}.json`);
const convertContractFileToJson = await contractFile.json();

const _myContract = contract(convertContractFileToJson);
_myContract.setProvider(provider);

let deployedContract = null;

try{
    deployedContract = await _myContract.deployed();

}catch  (e){
    console.error(e,"You are in The wrony Network");

}

return deployedContract;

}