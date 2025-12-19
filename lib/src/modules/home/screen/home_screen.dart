// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shadprocess/src/core/repository/case/case_repository.dart';
import 'package:shadprocess/src/modules/home/widgets/calendar_grid.dart';
import 'package:shadprocess/src/modules/home/widgets/create_process_button.dart';
import 'package:shadprocess/src/modules/home/widgets/process_detail_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final caseRepository = GetIt.I<CaseRepository>();
  late final ValueNotifier<DateTime> _selectedDateNotifier;

  final Color _bgScaffold = const Color(0xFF0F1113);
  final Color _accentBlue = const Color(0xFF00D1FF);

  @override
  void initState() {
    super.initState();
    _selectedDateNotifier = ValueNotifier(DateTime.now());
  }

  Future<void> _onRefresh() async {
    // Ao atualizar, resetamos a data para "hoje" ou apenas forçamos o rebuild
    setState(() {
      // Força a reconstrução do FutureBuilder e widgets dependentes
    });
    await Future.delayed(const Duration(milliseconds: 600));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgScaffold,
      appBar: AppBar(
        backgroundColor: _bgScaffold,
        elevation: 0,
        toolbarHeight: 60,
        title: const Text(
          'Acompanhar e Criar Processos',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
      // O RefreshIndicator agora engloba o CustomScrollView para atualizar TUDO
      body: RefreshIndicator(
        color: _accentBlue,
        backgroundColor: const Color(0xFF1A1D21),
        onRefresh: _onRefresh,
        child: CustomScrollView(
          // AlwaysScrollable permite o pull-to-refresh mesmo sem conteúdo longo
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            // Parte Superior: Botão e Calendário
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const CreateProcessButton(),
                    const SizedBox(height: 16),
                    CalendarGrid(dateNotifier: _selectedDateNotifier),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            // Parte Inferior: Lista de Processos
            ValueListenableBuilder<DateTime>(
              valueListenable: _selectedDateNotifier,
              builder: (context, selectedDate, _) {
                return FutureBuilder<List<CaseListItem>>(
                  future: caseRepository.getCasesByDate(selectedDate),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SliverFillRemaining(
                        hasScrollBody: false,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Color(0xFF00D1FF),
                          ),
                        ),
                      );
                    }

                    final cases = snapshot.data ?? [];

                    if (cases.isEmpty) {
                      return SliverFillRemaining(
                        hasScrollBody: false,
                        child: Center(
                          child: Text(
                            'Nenhum processo para este dia.',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.4),
                            ),
                          ),
                        ),
                      );
                    }

                    return SliverPadding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          final item = cases[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: ProcessDetailCard(
                              process: item.legalCase,
                              mainPartyName: item.mainPartyName,
                            ),
                          );
                        }, childCount: cases.length),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
