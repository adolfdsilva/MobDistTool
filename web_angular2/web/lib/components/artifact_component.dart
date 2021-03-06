import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'dart:async';
import 'package:angular2_components/angular2_components.dart';
import '../commons.dart';
import '../services/modal_service.dart';

class ArtifactDeletedEvent{
  MDTArtifact artifact;
  String sortIdentifier;
  ArtifactDeletedEvent(this.artifact,this.sortIdentifier);
}

@Component(
    selector: 'artifact',
    directives: const [materialDirectives],
    templateUrl: 'artifact_component.html')
class ArtifactComponent extends BaseComponent {
  MDTQueryService _mdtQueryService;
  ModalService _modalService;
  ArtifactComponent(this._mdtQueryService, this._modalService, GlobalService globalService) : super.withGlobal(globalService);
  @Input()
  String sortIdentifier ="";
  @Input()
  bool canDelete = false;
  @Input()
  MDTArtifact artifact;
  @Output()
  var artifactDeleted = new EventEmitter();

  bool isCollapsed = true;

  List<String> get metaDataKeys => (artifact!=null && artifact.metaDataTags != null) ? artifact.metaDataTags.keys.toList() : new List<String>();

  int get artifactSize => artifact==null ? 0 : (artifact.size/(1024*1024)).round();

  bool get canInstall => ((global_service.currentDevice == Platform.IOS) || (global_service.currentDevice == Platform.ANDROID));

  void downloadArtifact(){
    _mdtQueryService.downloadArtifact(artifact.uuid);
  }

  void downloadOrInstall(){
    if (canInstall){
      installArtifact();
    }else {
      downloadArtifact();
    }
  }

  void installArtifact(){
    _mdtQueryService.InstallArtifact(artifact.uuid);
  }

  void deleteArtifact(){
    artifactDeleted.emit(new ArtifactDeletedEvent(artifact,sortIdentifier));
   // artifactDeleted.emit
   // _mdt
   // _parent.deleteArtifact(artifact,sortIdentifier);
  }

  void generateQrCode(){
    var qrCodeTitle = artifact.name;
    if (artifact.branch == null){
      //latest
      qrCodeTitle = "$qrCodeTitle - Latest";
    }else {
      qrCodeTitle = "$qrCodeTitle - ${artifact.version} - ${artifact.branch}";
    }
    _modalService.displayQrCode(artifact,qrCodeTitle);
   // ArtifactDownloadQRCode.createQRCode(this._parent.modal,scope,qrCodeTitle,artifact.uuid);
  }
}