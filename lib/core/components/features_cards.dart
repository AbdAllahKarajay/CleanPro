import 'package:flutter/material.dart';

import '../design/design_principles.dart';
import 'app_card.dart';

class AppCardWithConfig {
  static AppCard service({
    Key? key,
    required String title,
    required String description,
    String? price,
    String? duration,
    String? imageUrl,
    VoidCallback? onTap,
    bool isSelected = false,
  }) {
    return AppCard(
      key: key,
      onTap: onTap,
      isInteractive: true,
      backgroundColor:
      isSelected ? DesignPrinciples.primaryBlue.withOpacity(0.1) : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (imageUrl != null) ...[
            ClipRRect(
              borderRadius: BorderRadius.circular(
                DesignPrinciples.borderRadiusBase,
              ),
              child: Image.network(
                imageUrl,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 120,
                    width: double.infinity,
                    color: DesignPrinciples.neutralGray200,
                    child: const Icon(
                      Icons.image,
                      color: DesignPrinciples.neutralGray400,
                      size: 48,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: DesignPrinciples.spacing4),
          ],
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: DesignPrinciples.fontSizeLg,
                    fontWeight: DesignPrinciples.fontWeightSemiBold,
                    fontFamily: DesignPrinciples.fontFamilyPrimary,
                  ),
                ),
              ),
              if (price != null) ...[
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: DesignPrinciples.fontSizeBase,
                    fontWeight: DesignPrinciples.fontWeightBold,
                    fontFamily: DesignPrinciples.fontFamilyPrimary,
                    color: DesignPrinciples.primaryBlue,
                  ),
                ),
              ],
            ],
          ),
          if (description.isNotEmpty) ...[
            const SizedBox(height: DesignPrinciples.spacing2),
            Text(
              description,
              style: const TextStyle(
                fontSize: DesignPrinciples.fontSizeSm,
                fontWeight: DesignPrinciples.fontWeightNormal,
                fontFamily: DesignPrinciples.fontFamilyPrimary,
                color: DesignPrinciples.neutralGray600,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
          if (duration != null) ...[
            const SizedBox(height: DesignPrinciples.spacing3),
            Row(
              children: [
                const Icon(
                  Icons.access_time,
                  size: 16,
                  color: DesignPrinciples.neutralGray500,
                ),
                const SizedBox(width: DesignPrinciples.spacing1),
                Text(
                  duration,
                  style: const TextStyle(
                    fontSize: DesignPrinciples.fontSizeXs,
                    fontWeight: DesignPrinciples.fontWeightNormal,
                    fontFamily: DesignPrinciples.fontFamilyPrimary,
                    color: DesignPrinciples.neutralGray500,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  static AppCard booking({
    Key? key,
    required String serviceName,
    required String date,
    required String time,
    required String status,
    String? address,
    String? price,
    VoidCallback? onTap,
  }) {
    Color statusColor;
    switch (status.toLowerCase()) {
      case 'confirmed':
        statusColor = DesignPrinciples.successGreen;
        break;
      case 'pending':
        statusColor = DesignPrinciples.warningYellow;
        break;
      case 'cancelled':
        statusColor = DesignPrinciples.errorRed;
        break;
      default:
        statusColor = DesignPrinciples.neutralGray500;
    }

    return AppCard(
      key: key,
      onTap: onTap,
      isInteractive: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  serviceName,
                  style: const TextStyle(
                    fontSize: DesignPrinciples.fontSizeLg,
                    fontWeight: DesignPrinciples.fontWeightSemiBold,
                    fontFamily: DesignPrinciples.fontFamilyPrimary,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: DesignPrinciples.spacing2,
                  vertical: DesignPrinciples.spacing1,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(
                    DesignPrinciples.borderRadiusFull,
                  ),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: DesignPrinciples.fontSizeXs,
                    fontWeight: DesignPrinciples.fontWeightMedium,
                    fontFamily: DesignPrinciples.fontFamilyPrimary,
                    color: statusColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: DesignPrinciples.spacing3),
          Row(
            children: [
              const Icon(
                Icons.calendar_today,
                size: 16,
                color: DesignPrinciples.neutralGray500,
              ),
              const SizedBox(width: DesignPrinciples.spacing2),
              Text(
                date,
                style: const TextStyle(
                  fontSize: DesignPrinciples.fontSizeSm,
                  fontWeight: DesignPrinciples.fontWeightNormal,
                  fontFamily: DesignPrinciples.fontFamilyPrimary,
                  color: DesignPrinciples.neutralGray700,
                ),
              ),
              const SizedBox(width: DesignPrinciples.spacing4),
              const Icon(
                Icons.access_time,
                size: 16,
                color: DesignPrinciples.neutralGray500,
              ),
              const SizedBox(width: DesignPrinciples.spacing2),
              Text(
                time,
                style: const TextStyle(
                  fontSize: DesignPrinciples.fontSizeSm,
                  fontWeight: DesignPrinciples.fontWeightNormal,
                  fontFamily: DesignPrinciples.fontFamilyPrimary,
                  color: DesignPrinciples.neutralGray700,
                ),
              ),
            ],
          ),
          if (address != null) ...[
            const SizedBox(height: DesignPrinciples.spacing3),
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  size: 16,
                  color: DesignPrinciples.neutralGray500,
                ),
                const SizedBox(width: DesignPrinciples.spacing2),
                Expanded(
                  child: Text(
                    address,
                    style: const TextStyle(
                      fontSize: DesignPrinciples.fontSizeSm,
                      fontWeight: DesignPrinciples.fontWeightNormal,
                      fontFamily: DesignPrinciples.fontFamilyPrimary,
                      color: DesignPrinciples.neutralGray700,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
          if (price != null) ...[
            const SizedBox(height: DesignPrinciples.spacing3),
            Row(
              children: [
                const Spacer(),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: DesignPrinciples.fontSizeBase,
                    fontWeight: DesignPrinciples.fontWeightBold,
                    fontFamily: DesignPrinciples.fontFamilyPrimary,
                    color: DesignPrinciples.primaryBlue,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  static AppCard profile({
    Key? key,
    required String name,
    required String email,
    String? phone,
    String? avatarUrl,
    VoidCallback? onTap,
  }) {
    return AppCard(
      key: key,
      onTap: onTap,
      isInteractive: true,
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: DesignPrinciples.neutralGray200,
            backgroundImage: avatarUrl != null ? NetworkImage(avatarUrl) : null,
            child:
            avatarUrl == null
                ? Text(
              name.isNotEmpty ? name[0].toUpperCase() : 'U',
              style: const TextStyle(
                fontSize: DesignPrinciples.fontSizeLg,
                fontWeight: DesignPrinciples.fontWeightBold,
                fontFamily: DesignPrinciples.fontFamilyPrimary,
                color: DesignPrinciples.neutralGray700,
              ),
            )
                : null,
          ),
          const SizedBox(width: DesignPrinciples.spacing4),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: DesignPrinciples.fontSizeLg,
                    fontWeight: DesignPrinciples.fontWeightSemiBold,
                    fontFamily: DesignPrinciples.fontFamilyPrimary,
                  ),
                ),
                const SizedBox(height: DesignPrinciples.spacing1),
                Text(
                  email,
                  style: const TextStyle(
                    fontSize: DesignPrinciples.fontSizeSm,
                    fontWeight: DesignPrinciples.fontWeightNormal,
                    fontFamily: DesignPrinciples.fontFamilyPrimary,
                    color: DesignPrinciples.neutralGray600,
                  ),
                ),
                if (phone != null) ...[
                  const SizedBox(height: DesignPrinciples.spacing1),
                  Text(
                    phone,
                    style: const TextStyle(
                      fontSize: DesignPrinciples.fontSizeSm,
                      fontWeight: DesignPrinciples.fontWeightNormal,
                      fontFamily: DesignPrinciples.fontFamilyPrimary,
                      color: DesignPrinciples.neutralGray600,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const Icon(
            Icons.chevron_right,
            color: DesignPrinciples.neutralGray400,
          ),
        ],
      ),
    );
  }

  static AppCard info({
    Key? key,
    required String title,
    required String content,
    IconData? icon,
    Color? iconColor,
    VoidCallback? onTap,
  }) {
    return AppCard(
      key: key,
      onTap: onTap,
      isInteractive: onTap != null,
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              color: iconColor ?? DesignPrinciples.primaryBlue,
              size: 24,
            ),
            const SizedBox(width: DesignPrinciples.spacing4),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: DesignPrinciples.fontSizeBase,
                    fontWeight: DesignPrinciples.fontWeightSemiBold,
                    fontFamily: DesignPrinciples.fontFamilyPrimary,
                  ),
                ),
                const SizedBox(height: DesignPrinciples.spacing1),
                Text(
                  content,
                  style: const TextStyle(
                    fontSize: DesignPrinciples.fontSizeSm,
                    fontWeight: DesignPrinciples.fontWeightNormal,
                    fontFamily: DesignPrinciples.fontFamilyPrimary,
                    color: DesignPrinciples.neutralGray600,
                  ),
                ),
              ],
            ),
          ),
          if (onTap != null) ...[
            const Icon(
              Icons.chevron_right,
              color: DesignPrinciples.neutralGray400,
            ),
          ],
        ],
      ),
    );
  }
}
