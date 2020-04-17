import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'build_cliente.g.dart';

abstract class BuildCliente
    implements Built<BuildCliente, BuildClienteBuilder> {
  @nullable
  String get codcli;

  @nullable
  String get nombrecli;
// Se comenta parametros para el ejemplo solo trabajar con dos parametros
//  @nullable
//  String get desccli;
//
//  @nullable
//  String get direccioncli;
//
//  @nullable
//  String get telefono1cli;
//
//  @nullable
//  String get telefono2cli;
//
//  @nullable
//  String get faxcli;
//
//  @nullable
//  String get contactocli;
//
//  @nullable
//  String get fechainicli;
//
//  @nullable
//  String get fechaucomcli;
//
//  @nullable
//  double get acumcomcli;
//
//  @nullable
//  int get creditocli;
//
//  //Null tipocli;
//  @nullable
//  String get statuscli;
//
//  @nullable
//  int get descuecli;
//
//  @nullable
//  String get mailcli;
//
//  //Null codtcxc;
//  @nullable
//  String get codzona;
//
//  //Null codniving;
//  @nullable
//  String get fechanaccli;
//
//  //Null sexocli;
//  @nullable
//  int get desppcli;
//
//  @nullable
//  String get rutacli;
//
//  @nullable
//  int get plazopagdiascli;
//
//  @nullable
//  int get plazopagmescli;
//
//  @nullable
//  String get codtcli;
//
//  @nullable
//  int get codven;
//
//  @nullable
//  int get codordcli;
//
//  @nullable
//  String get comentariocli;
//
//  @nullable
//  String get legalcli;
//
//  @nullable
//  String get docresgarcli;
//
//  @nullable
//  String get nodocresgarcli;
//
//  @nullable
//  int get valdocresgarcli;
//
//  @nullable
//  String get f1cli;
//
//  @nullable
//  String get f2cli;
//
//  @nullable
//  String get f3cli;
//
//  @nullable
//  String get f4cli;
//
//  @nullable
//  String get f5cli;
//
//  @nullable
//  String get f6cli;
//
//  @nullable
//  String get f7cli;
//
//  @nullable
//  int get of1cli;
//
//  @nullable
//  int get of2cli;
//
//  @nullable
//  int get of3cli;
//
//  @nullable
//  int get of4cli;
//
//  @nullable
//  int get of5cli;
//
//  @nullable
//  int get of6cli;
//
//  @nullable
//  int get of7cli;
//
//  @nullable
//  String get codsm;
//
//  @nullable
//  String get codsegm;
//
//  @nullable
//  String get coddtcli;
//
//  @nullable
//  int get codlp;
//
//  @nullable
//  String get docvarcli;
//
//  @nullable
//  int get flagpromocli;
//
//  @nullable
//  int get flagsuccli;
//
//  @nullable
//  String get rucmtzcli;
//
//  @nullable
//  int get flagcxcmtzcli;
//
//  //Null codzonadistcli;
//  //Null f1dcli;
//  //Null f2dcli;
//  //Null f3dcli;
//  //Null f4dcli;
//  //Null f5dcli;
//  //Null f6dcli;
//  //Null f7dcli;
//  //Null of1dcli;
//  //Null of2dcli;
//  //Null of3dcli;
//  //Null of4dcli;
//  //Null of5dcli;
//  //Null of6dcli;
//  //Null of7dcli;
//  @nullable
//  String get apellidocomcli;
//
//  @nullable
//  String get nombrecompcli;
//
//  @nullable
//  String get calleprcompcli;
//
//  @nullable
//  String get nocallecompcli;
//
//  @nullable
//  String get tranversalcompcli;
//
//  @nullable
//  String get notarjdescli;
//
//  @nullable
//  String get fechacadtarjdescli;
//
//  @nullable
//  int get flagpromdircli;
//
//  @nullable
//  int get flagpromcasillacli;
//
//  @nullable
//  String get casillapostalcli;
//
//  @nullable
//  int get flagivacerocli;
//
//  @nullable
//  String get latgpscli;
//
//  @nullable
//  String get longgpscli;
//
//  @nullable
//  String get codcob;
//
//  @nullable
//  int get falgrevcli;
//
//  @nullable
//  String get et1cli;
//
//  @nullable
//  String get et2cli;
//
//  @nullable
//  String get et3cli;
//
//  @nullable
//  int get flagrestringidocli;
//
//  //Null clasecli;
//  //Null estcivcli;
//  //Null orgingcli;
//  //Null codti;
//  //Null valendemjudcli;
//  @nullable
//  int get flagdocgarcli;
//
//  //Null flagretimpsricli;
//  //Null flagroblllevcontcli;
//  //Null nocontespcli;
//  //Null totchposcli;
//  @nullable
//  String get mailingcli;
//
//  @nullable
//  String get clavecli;
//
//  //Null calvecli;
//  //Null treinta;
//  //Null sesenta;
//  //Null noventa;
//  @nullable
//  double get masnov;
//
//  @nullable
//  int get flagpasaportecli;
//
//  @nullable
//  int get flagenviomailabonocxccli;
//
//  @nullable
//  int get flagprogcxccli;
//
//  //Null codfp;
//  //Null cartcastigadacli;
//  //Null flagenveccli;
//  //Null flagposmovil;
//  //Null flagpermitirpedwebcli;
//  //Null flagposmovilversion;

  BuildCliente._();

  factory BuildCliente([updates(BuildClienteBuilder b)]) = _$BuildCliente;

  static Serializer<BuildCliente> get serializer => _$buildClienteSerializer;

}
