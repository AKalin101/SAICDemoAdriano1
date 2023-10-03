let contract;
let signer;
let contractWithSigner;

main();

async function main() {
    // required code to connect to MetaMask/Web3
    const provider = new ethers.providers.Web3Provider(window.ethereum, "any");
    await provider.send("eth_requestAccounts", []);
    signer = provider.getSigner();
    contract = new ethers.Contract(contractAddress, contractABI, provider);
    contractWithSigner = contract.connect(signer);

    // PLACE YOUR CODE BELOW THIS COMMENT
    $('#playstationButton').click(setPlaystation);
    $('#XboxButton').click(setXbox);
    $('#PCButton').click(setPC);
    $('#NintendoButton').click(setNintendo);

    function setPlaystation() {
        contractWithSigner.vote("Playstation")
    }
    function setXbox() {
        contractWithSigner.vote("Xbox")
    }
    function setPC() {
        contractWithSigner.vote("PC")
    }
    function setNintendo() {
        ccontractWithSigner.vote("Nintendo")
    }
    
    displayVotes () 

    async function displayVotes() {
        let allVotes = await contract.getVotes();
        if (allVotes.length > 0) {

            allVotes.forEach(vote => {
                // function that displays votes somewhere
            })
        }
    }
    
    // Event listeners that make it so when you click the "submit" buttons on the web page, the colors get passed to the contract
    $('#PlaystationSubmit').click(setPlaystation);
    $('#XboxSubmit').click(setXbox);
    $('#PCSubmit').click(setPC);
    $('#NintendoSubmit').click(setNintendo);

    
}
  
   
// for (let button = 0; button < $('.voteButton').length; button++) {
    //     // $('.voteButton')[button].click(setVote(this.html))
    //     console.log(this.html, "TRIGGERED")
    // }