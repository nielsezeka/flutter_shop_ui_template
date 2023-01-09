import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:iconsax/iconsax.dart';
import '../../presentionals_index.dart';
import '../app_item_style_configuration.dart';

enum TrackingStatus {
  shopPackaging,
  carTransporting,
  inShipping,
  userChecking,
}

extension GetStatus on TrackingStatus {
  int toInt() {
    switch (this) {
      case TrackingStatus.shopPackaging:
        return 0;
      case TrackingStatus.carTransporting:
        return 1;
      case TrackingStatus.inShipping:
        return 2;
      case TrackingStatus.userChecking:
        return 3;
      default:
        return 0;
    }
  }

  static getTrack() => [
        TrackingNodeModel(
          icon: BoxIcons.bx_package,
          tittle: 'Packaging your order',
          status: TrackingStatus.shopPackaging,
        ),
        TrackingNodeModel(
          icon: LineAwesome.truck_solid,
          tittle: 'Packet in delivery',
          status: TrackingStatus.carTransporting,
        ),
        TrackingNodeModel(
          icon: LineAwesome.people_carry_solid,
          tittle: 'Packet in shipping',
          status: TrackingStatus.inShipping,
        ),
        TrackingNodeModel(
          icon: LineAwesome.box_open_solid,
          tittle: 'Checking your order',
          status: TrackingStatus.userChecking,
        ),
      ];
}

class TrackingNodeModel {
  final IconData icon;
  final String tittle;
  final TrackingStatus status;
  TrackingNodeModel({
    required this.icon,
    required this.tittle,
    required this.status,
  });
  bool isHighLighted(TrackingStatus currentTrackingStatus) {
    return status.toInt() - currentTrackingStatus.toInt() <= 0;
  }

  static bool forceCheckHighlight({
    required TrackingStatus forStatus,
    required TrackingStatus withStatus,
  }) {
    return forStatus.toInt() - withStatus.toInt() <= 0;
  }
}

class AppTrackingBar extends StatelessWidget {
  const AppTrackingBar({
    super.key,
    required this.tracks,
    required this.currentTrackingStatus,
  });
  final List<TrackingNodeModel> tracks;
  final TrackingStatus currentTrackingStatus;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppStyleConfiguration.itemDefaultHeight * 2,
          child: _renderTrackingIcons(tracks, context),
        ),
        Text(
          'Packet in delivery',
          style: Theme.of(context).textTheme.headline6,
        ),
      ],
    );
  }

  Widget _renderTrackingIcons(
    List<TrackingNodeModel> tracks,
    BuildContext context,
  ) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: tracks
                .map(
                  (track) => Expanded(
                    child: Icon(
                      track.icon,
                      size: 35,
                      color: track.isHighLighted(currentTrackingStatus)
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).textTheme.bodyText1!.color,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              _renderDotted(Theme.of(context)),
              Row(
                children: tracks
                    .map(
                      (track) => Expanded(
                        child: Center(
                          child: Icon(
                            Iconsax.tick_circle4,
                            size: 18,
                            color: track.isHighLighted(currentTrackingStatus)
                                ? Theme.of(context).primaryColor
                                : Theme.of(context).textTheme.bodyText1!.color,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _renderDotted(ThemeData theme) {
    return Row(
      children: [
        _renderPadding(),
        _renderDottedContainer(
          theme,
          TrackingNodeModel.forceCheckHighlight(
            forStatus: TrackingStatus.carTransporting,
            withStatus: currentTrackingStatus,
          ),
        ),
        _renderDottedContainer(
          theme,
          TrackingNodeModel.forceCheckHighlight(
            forStatus: TrackingStatus.inShipping,
            withStatus: currentTrackingStatus,
          ),
        ),
        _renderDottedContainer(
          theme,
          TrackingNodeModel.forceCheckHighlight(
            forStatus: TrackingStatus.userChecking,
            withStatus: currentTrackingStatus,
          ),
        ),
        _renderPadding(),
      ],
    );
  }

  Widget _renderPadding() {
    return Expanded(
      flex: 1,
      child: Container(),
    );
  }

  _renderDottedContainer(ThemeData theme, bool isHighLighted) {
    return Expanded(
      flex: 2,
      child: Container(
        height: 1,
        margin: EdgeInsets.symmetric(
            horizontal: AppStyleConfiguration.paddingSpacer * 3),
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: DashedLinePainter(theme.primaryColor),
              ),
            ),
            isHighLighted
                ? Container()
                : Positioned.fill(
                    child: CustomPaint(
                      painter:
                          DashedLinePainter(theme.textTheme.bodyText1!.color!),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
