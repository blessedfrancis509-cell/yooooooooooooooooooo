import React, { useState } from "react";
import { createRoot } from "react-dom/client";
import {
  Accessibility,
  Activity,
  Award,
  Ban,
  Bell,
  ChevronLeft,
  ChevronRight,
  ClipboardList,
  Download,
  EyeOff,
  Heart,
  History,
  Info,
  Layers,
  ListChecks,
  Lock,
  LogOut,
  MessageCircle,
  MessageSquare,
  Moon,
  QrCode,
  Settings as SettingsIcon,
  ShieldCheck,
  SlidersHorizontal,
  UserRound,
  Video,
  Wallet,
} from "lucide-react";
import "./styles.css";

const PURPLE = "#31105f";
const PURPLE_MID = "#6d28d9";
const PURPLE_SOFT = "#a78bfa";
const MINT = "#bdf9e6";
const CARD_BG = "rgba(255, 255, 255, 0.94)";

function StatusBar() {
  return (
    <div className="status-bar">
      <span>9:41</span>
      <div className="status-icons" aria-hidden="true">
        <span className="signal"><i /><i /><i /><i /></span>
        <span className="wifi">◒</span>
        <span className="battery"><i /></span>
      </div>
    </div>
  );
}

function Header({ title, onBack }) {
  return (
    <header className="header">
      <button onClick={onBack} className="icon-button" aria-label="Back">
        <ChevronLeft size={16} strokeWidth={2.4} />
      </button>
      <h1>{title}</h1>
      <button className="icon-button notification-dot" aria-label="Notifications">
        <Bell size={14} strokeWidth={2.2} />
      </button>
    </header>
  );
}

function Row({ icon: Icon, label, onClick, trailing, danger, indicator }) {
  return (
    <button onClick={onClick} className={`row ${danger ? "danger" : ""}`}>
      {Icon && <Icon className="row-icon" size={13} strokeWidth={2} />}
      <span className="row-label">{label}</span>
      {indicator && <span className="indicator">{indicator}</span>}
      {trailing ?? (!danger ? <ChevronRight className="chevron" size={12} /> : null)}
    </button>
  );
}

function Toggle({ on, onToggle }) {
  return (
    <button
      onClick={(event) => {
        event.stopPropagation();
        onToggle();
      }}
      className={`toggle ${on ? "toggle-on" : ""}`}
      aria-pressed={on}
      aria-label="Toggle setting"
    >
      <span />
    </button>
  );
}

function Section({ children }) {
  return <section className="section">{children}</section>;
}

function AccountScreen({ goTo }) {
  return (
    <div className="screen account-screen">
      <div className="hero">
        <StatusBar />
        <Header title="Account" onBack={() => {}} />
        <div className="profile">
          <img
            src="https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=128&h=128&fit=crop&crop=faces"
            alt="Marie T Wiedman"
          />
          <strong>Marie T Wiedman</strong>
          <span>marie@gmail.com</span>
        </div>
      </div>

      <main className="content account-content">
        <Section>
          <Row icon={Wallet} label="Wallet" />
        </Section>
        <Section>
          <Row icon={UserRound} label="Edit Profile" />
          <Row icon={Ban} label="View Blocked Users" />
          <Row icon={ClipboardList} label="Task Center" />
          <Row icon={Activity} label="Activities" />
        </Section>
        <Section>
          <Row icon={SettingsIcon} label="Settings" onClick={() => goTo("settings")} />
          <Row icon={Award} label="Level" />
          <Row icon={Heart} label="Favorites" />
          <Row icon={Download} label="Downloads" />
        </Section>
        <Section>
          <Row icon={LogOut} label="Log out" danger />
        </Section>
      </main>
    </div>
  );
}

function SettingsScreen({ goTo }) {
  const [notif, setNotif] = useState(true);
  const [material, setMaterial] = useState(true);
  const [theme, setTheme] = useState(false);

  return (
    <div className="screen settings-screen">
      <div className="hero compact">
        <StatusBar />
        <Header title="Setting" onBack={() => goTo("account")} />
      </div>
      <main className="content settings-content">
        <Section>
          <Row icon={SlidersHorizontal} label="Preferences" />
          <Row icon={Lock} label="Privacy" />
          <Row icon={ShieldCheck} label="Account Management" indicator="Unprotected" />
          <Row icon={History} label="Search History" />
          <Row icon={ListChecks} label="List Project" />
        </Section>
        <Section>
          <Row icon={Bell} label="Notification" trailing={<Toggle on={notif} onToggle={() => setNotif((v) => !v)} />} />
          <Row icon={Video} label="Video Quality" trailing={<span className="value">Auto <ChevronRight size={12} /></span>} />
          <Row icon={Layers} label="Material Library" trailing={<Toggle on={material} onToggle={() => setMaterial((v) => !v)} />} />
          <Row icon={Moon} label="Theme mode" trailing={<Toggle on={theme} onToggle={() => setTheme((v) => !v)} />} />
          <Row icon={EyeOff} label="Sensitive Content Preferences" />
        </Section>
        <Section>
          <Row icon={MessageCircle} label="Fun VisionChat" />
          <Row icon={Info} label="About Us" />
          <Row icon={QrCode} label="Scan QR Code" />
          <Row icon={Accessibility} label="Accessibility" />
          <Row icon={MessageSquare} label="SMS Notification" />
        </Section>
        <Section>
          <Row icon={MessageCircle} label="Fun VisionChat" />
        </Section>
      </main>
    </div>
  );
}

function PhoneFrame({ children }) {
  return (
    <div className="phone-frame">
      <div className="phone-notch" />
      <div className="phone-screen">{children}</div>
    </div>
  );
}

function App() {
  const [screen, setScreen] = useState("account");

  return (
    <div className="app-shell" style={{ "--purple": PURPLE, "--purple-mid": PURPLE_MID, "--purple-soft": PURPLE_SOFT, "--mint": MINT, "--card-bg": CARD_BG }}>
      <PhoneFrame><AccountScreen goTo={setScreen} /></PhoneFrame>
      <PhoneFrame><SettingsScreen goTo={setScreen} /></PhoneFrame>
      <div className="mobile-switcher">
        <button className={screen === "account" ? "active" : ""} onClick={() => setScreen("account")}>Account</button>
        <button className={screen === "settings" ? "active" : ""} onClick={() => setScreen("settings")}>Setting</button>
      </div>
      <div className="single-phone"><PhoneFrame>{screen === "account" ? <AccountScreen goTo={setScreen} /> : <SettingsScreen goTo={setScreen} />}</PhoneFrame></div>
    </div>
  );
}

createRoot(document.getElementById("root")).render(<App />);
