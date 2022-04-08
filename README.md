![OddOrEven](https://user-images.githubusercontent.com/78970916/162456449-dfd98401-3078-4287-ad1e-8a688a8582c5.png)

This smart contract is a gambling game. It can be played with only two players, one player chooses odd or even and the second player tries to guess. If the second player guesses correctly, he will receive all the money that was cleared at the beginning. If the second player guesses wrong, the first player gets all the money.

* The manager of the contract can only use the pickWinner function
* If player one and player two is the same person money will be refund.

## Usage
* Before the initialize this contract you need to clarify the betValue amount.
* For choosing [odd = 1]
* For choosing [even = 0]
* Before the choice, you need to pay the same betValue amount.

<b>Note: betValue taking as an Ether not Wei</b>

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)
