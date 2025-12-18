// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:shadprocess/src/core/database/database.dart';

class ProcessDetailCard extends StatelessWidget {
  final LegalCase process;
  final String mainPartyName;

  const ProcessDetailCard({
    super.key,
    required this.process,
    required this.mainPartyName,
  });

  @override
  Widget build(BuildContext context) {
    const accent = Color(0xFF00D1FF);
    final borderColor = Colors.white.withOpacity(0.08);

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1D21),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  process.caseNumber,
                  style: const TextStyle(
                    color: accent,
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                  ),
                ),
              ),
              _buildStatusBadge(process.status),
            ],
          ),
          const SizedBox(height: 14),
          _buildInfoRow(
            Icons.person_rounded,
            "Parte",
            mainPartyName,
            isMain: true,
          ),
          const SizedBox(height: 8),
          _buildInfoRow(
            Icons.account_balance_rounded,
            "Tribunal",
            process.court,
          ),
          const SizedBox(height: 8),
          _buildInfoRow(Icons.gavel_rounded, "Tipo", process.caseType),
          const Divider(height: 24, color: Colors.white10),
          Row(
            children: [
              Icon(
                Icons.flag_rounded,
                size: 14,
                color: _getPriorityColor(process.priority),
              ),
              const SizedBox(width: 6),
              Text(
                "Prioridade: ${process.priority}",
                style: const TextStyle(
                  color: Colors.white54,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(
    IconData icon,
    String label,
    String value, {
    bool isMain = false,
  }) {
    return Row(
      children: [
        Icon(icon, size: 16, color: isMain ? Colors.white70 : Colors.white38),
        const SizedBox(width: 10),
        Text("$label: ", style: TextStyle(color: Colors.white38, fontSize: 13)),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              color: isMain ? Colors.white : Colors.white70,
              fontSize: 13,
              fontWeight: isMain ? FontWeight.bold : FontWeight.normal,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildStatusBadge(String status) {
    Color color = Colors.blueAccent;
    if (status.toLowerCase().contains('ativ')) color = const Color(0xFF4ADE80);
    if (status.toLowerCase().contains('encerr')) color = Colors.redAccent;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Text(
        status.toUpperCase(),
        style: TextStyle(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Color _getPriorityColor(String p) =>
      p.toLowerCase().contains('alta') ? Colors.redAccent : Colors.amber;
}
