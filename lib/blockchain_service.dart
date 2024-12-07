import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';

class BlockchainService {
  final String rpcUrl;
  final String privateKey;

  late Web3Client _client;
  late Credentials _credentials;

  BlockchainService(this.rpcUrl, this.privateKey) {
    _client = Web3Client(rpcUrl, Client());
    _credentials = EthPrivateKey.fromHex(privateKey);
  }

  Future<String> getBalance(String address) async {
    final balance = await _client.getBalance(EthereumAddress.fromHex(address));
    return balance.getValueInUnit(EtherUnit.ether).toString();
  }

  // Add more methods to interact with smart contracts
}
