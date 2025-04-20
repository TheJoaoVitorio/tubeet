import 'package:flutter/material.dart';

class CarouselCircleCard extends StatefulWidget {
  final List<String> items;
  final Function(int)? onItemSelected;

  const CarouselCircleCard({
    super.key,
    required this.items,
    this.onItemSelected,
  });

  @override
  State<CarouselCircleCard> createState() => _CarouselCircleCardState();
}

class _CarouselCircleCardState extends State<CarouselCircleCard> {
  int _selectedIndex = 0;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_selectedIndex != 0) {
        _scrollToSelectedItem(_selectedIndex);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSelectedItem(int index) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;
    final double itemWidth = isMobile ? 100.0 : 200.0; 
    final double screenWidth = MediaQuery.of(context).size.width;
    final double maxScroll = _scrollController.position.maxScrollExtent;
    
    double targetOffset;
    if (isMobile) {
      targetOffset = (index * itemWidth) - (screenWidth / 4);
    } else {
      targetOffset = (index * itemWidth) - (screenWidth / 2) + (itemWidth / 2);
    }
    
    targetOffset = targetOffset.clamp(0.0, maxScroll);

    _scrollController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;
    
    return SizedBox(
      height: 50,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          final bool isSelected = index == _selectedIndex;
          
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
              widget.onItemSelected?.call(index);
              _scrollToSelectedItem(index);
            },
            child: Container(
              width: isMobile ? 90 : 180,
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue : Colors.transparent,
                  border: Border.all(
                    color: Colors.blue,
                    width: isSelected ? 2 : 1,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: isSelected ? [
                    BoxShadow(
                      color: Colors.blue,
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 1),
                    )
                  ] : null,
                ),
                child: Center(
                  child: Text(
                    widget.items[index],
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.blue,
                      fontSize: isMobile ? 12 : 18,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}