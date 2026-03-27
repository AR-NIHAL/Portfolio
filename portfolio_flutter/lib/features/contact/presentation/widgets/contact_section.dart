import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/responsive/responsive_helper.dart';
import '../../../../shared/widgets/decorative_divider.dart';
import '../../../../shared/widgets/section_container.dart';
import '../../../../shared/widgets/section_title_box.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return SectionContainer(
      backgroundColor: AppColors.background,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.horizontalPadding(context),
        vertical: ResponsiveHelper.sectionSpacing(context),
      ),
      child: Column(
        children: [
          const SectionTitleBox(title: 'Contact'),
          SizedBox(height: isMobile ? 28 : 38),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 760),
            child: Text(
              'Have a project in mind, a collaboration idea, or just want to say hello? I would love to hear from you. Feel free to reach out through the form below and I will get back to you as soon as I can.',
              textAlign: TextAlign.center,
              style: AppTextStyles.body.copyWith(
                fontSize: isMobile ? 14 : 15,
                height: 1.95,
              ),
            ),
          ),
          SizedBox(height: isMobile ? 26 : 34),
          const DecorativeDivider(width: 170),
          SizedBox(height: isMobile ? 42 : 64),
          const _ContactForm(),
        ],
      ),
    );
  }
}

class _ContactForm extends StatefulWidget {
  const _ContactForm();

  @override
  State<_ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<_ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Message captured. Connect your backend or email service next.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: isMobile ? 360 : 560),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _ContactInput(
                controller: _nameController,
                hintText: 'ENTER YOUR NAME*',
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: AppSpacing.lg),
              _ContactInput(
                controller: _emailController,
                hintText: 'ENTER YOUR EMAIL*',
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!value.contains('@')) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: AppSpacing.lg),
              _ContactInput(
                controller: _phoneController,
                hintText: 'PHONE NUMBER',
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: AppSpacing.lg),
              _ContactInput(
                controller: _messageController,
                hintText: 'YOUR MESSAGE*',
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your message';
                  }
                  return null;
                },
              ),
              SizedBox(height: isMobile ? 28 : 34),
              _SendAction(onTap: _submit),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactInput extends StatelessWidget {
  const _ContactInput({
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
    this.keyboardType,
    this.textInputAction,
    this.validator,
  });

  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      validator: validator,
      style: AppTextStyles.body.copyWith(fontSize: 14),
      cursorColor: AppColors.black,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyles.button.copyWith(
          color: AppColors.textPrimary.withOpacity(0.75),
          fontSize: 11,
          letterSpacing: 1.7,
        ),
        isDense: true,
        contentPadding: EdgeInsets.only(bottom: maxLines > 1 ? 18 : 14),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.black, width: 2),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.black, width: 2.2),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.black, width: 2),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.black, width: 2.2),
        ),
        errorStyle: AppTextStyles.bodyMuted.copyWith(
          fontSize: 12,
          height: 1.5,
        ),
      ),
    );
  }
}

class _SendAction extends StatefulWidget {
  const _SendAction({required this.onTap});

  final VoidCallback onTap;

  @override
  State<_SendAction> createState() => _SendActionState();
}

class _SendActionState extends State<_SendAction> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 160),
          opacity: _hovered ? 0.72 : 1,
          child: IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(width: 2, color: AppColors.textPrimary),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Text(
                    'SUBMIT',
                    style: AppTextStyles.button.copyWith(letterSpacing: 2.2),
                  ),
                ),
                Container(width: 2, color: AppColors.textPrimary),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
